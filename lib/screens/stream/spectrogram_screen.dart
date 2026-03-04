// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:async';
import 'dart:convert';
import 'dart:html' as html;
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:web_audio' as web_audio;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:birdnet_pi_app/l10n/app_localizations.dart';
import '../../config/api_config.dart';
import '../../config/theme.dart';
import '../../providers/auth_provider.dart';
import '../../services/api_service.dart';
import '../../widgets/app_shell.dart';
import '../../widgets/auth_lock_icon.dart';

// ═══════════════════════════════════════════════════════════
// Pre-computed RGBA color table (256 entries × 4 bytes)
// ═══════════════════════════════════════════════════════════
final Uint8List _colorLUT = () {
  final lut = Uint8List(256 * 4);
  for (int v = 0; v < 256; v++) {
    final o = v * 4;
    if (v < 10) {
      lut[o] = 0;
      lut[o + 1] = 0;
      lut[o + 2] = 0;
      lut[o + 3] = 255;
      continue;
    }
    final t = v / 255.0;
    int r, g, b;
    if (t < 0.2) {
      final f = t / 0.2;
      r = 0;
      g = 0;
      b = (f * 180).toInt();
    } else if (t < 0.4) {
      final f = (t - 0.2) / 0.2;
      r = 0;
      g = (f * 255).toInt();
      b = 180 + (f * 75).toInt();
    } else if (t < 0.6) {
      final f = (t - 0.4) / 0.2;
      r = 0;
      g = 255;
      b = (255 - f * 255).toInt();
    } else if (t < 0.75) {
      final f = (t - 0.6) / 0.15;
      r = (f * 255).toInt();
      g = 255;
      b = 0;
    } else if (t < 0.9) {
      final f = (t - 0.75) / 0.15;
      r = 255;
      g = (255 - f * 255).toInt();
      b = 0;
    } else {
      final f = (t - 0.9) / 0.1;
      r = 255;
      g = (f * 255).toInt();
      b = (f * 255).toInt();
    }
    lut[o] = r.clamp(0, 255);
    lut[o + 1] = g.clamp(0, 255);
    lut[o + 2] = b.clamp(0, 255);
    lut[o + 3] = 255;
  }
  return lut;
}();

/// Detect iOS / iPadOS Safari
bool _isIOSSafari() {
  final ua = html.window.navigator.userAgent;
  // iPhone, iPad, iPod
  if (ua.contains('iPhone') || ua.contains('iPad') || ua.contains('iPod')) {
    return true;
  }
  // iPadOS 13+ reports as Mac but has touch
  if (ua.contains('Macintosh') &&
      (html.window.navigator.maxTouchPoints ?? 0) > 1) {
    return true;
  }
  return false;
}

class SpectrogramScreen extends ConsumerStatefulWidget {
  const SpectrogramScreen({super.key});

  @override
  ConsumerState<SpectrogramScreen> createState() => _SpectrogramScreenState();
}

class _SpectrogramScreenState extends ConsumerState<SpectrogramScreen> {
  late final bool _useStaticMode;

  // ── Web Audio mode ──
  html.AudioElement? _audioElement;
  web_audio.AudioContext? _audioContext;
  web_audio.AnalyserNode? _analyser;
  web_audio.GainNode? _gainNode;
  int? _animFrameId;

  static const int _spectWidth = 2000;
  static const int _spectHeight = 512;
  static const int _fftSize = 1024;
  late Uint8List _pixels;
  ui.Image? _currentImage;
  final ValueNotifier<int> _frameCounter = ValueNotifier<int>(0);

  // ── Scrolling timing ──
  double _lastFrameTime = 0.0;
  double _fractionalPixels = 0.0;
  // Desired scrolling speed
  static const double _pixelsPerSecond = 150.0;

  // ── Static image mode (iOS) ──
  Timer? _refreshTimer;
  int _imageTimestamp = 0;
  int _refreshSeconds = 15;

  // ── Shared state ──
  bool _isStreaming = false;
  bool _isLoading = false;
  bool _isPaused = false;
  bool _isMuted = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _useStaticMode = _isIOSSafari();
    _pixels = Uint8List(_spectWidth * _spectHeight * 4);
    _loadRecordingLength();
  }

  Future<void> _loadRecordingLength() async {
    try {
      final config = await ref.read(apiServiceProvider).getRecordingLength();
      final recLen = config['RECORDING_LENGTH'];
      if (recLen != null) {
        _refreshSeconds = int.tryParse(recLen.toString()) ?? 15;
      }
    } catch (_) {}
  }

  @override
  void dispose() {
    _stop();
    _currentImage?.dispose();
    _frameCounter.dispose();
    _refreshTimer?.cancel();
    super.dispose();
  }

  // ─────────────────────────────────────────────────
  // Credentials & Start / Stop
  // ─────────────────────────────────────────────────

  // ─────────────────────────────────────────────────
  // Start / Stop (dispatches to correct mode)
  // ─────────────────────────────────────────────────

  Future<void> _start() async {
    if (_useStaticMode) {
      _startStaticMode();
    } else {
      await _startWebAudioMode();
    }
  }

  void _stop() {
    if (_useStaticMode) {
      _stopStaticMode();
    } else {
      _stopWebAudioMode();
    }
  }

  // ─────────────────────────────────────────────────
  // Static image mode (iOS Safari)
  // Refreshes /spectrogram.png every 2 seconds
  // ─────────────────────────────────────────────────

  void _startStaticMode() {
    setState(() {
      _isStreaming = true;
      _imageTimestamp = DateTime.now().millisecondsSinceEpoch;
    });
    _refreshTimer = Timer.periodic(Duration(seconds: _refreshSeconds), (_) {
      if (!_isPaused && mounted) {
        setState(() {
          _imageTimestamp = DateTime.now().millisecondsSinceEpoch;
        });
      }
    });
  }

  void _stopStaticMode() {
    _refreshTimer?.cancel();
    _refreshTimer = null;
    if (mounted) setState(() => _isStreaming = false);
  }

  // ─────────────────────────────────────────────────
  // Web Audio mode (Chrome, Firefox, desktop Safari)
  // ─────────────────────────────────────────────────

  Future<void> _startWebAudioMode() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      final api = ref.read(apiServiceProvider);
      final url = await api.getLiveStreamUrl();
      _audioElement = html.AudioElement(url)..autoplay = true;

      _audioContext = web_audio.AudioContext();
      if (_audioContext!.state == 'suspended') {
        await _audioContext!.resume();
      }

      _analyser = _audioContext!.createAnalyser()
        ..fftSize = _fftSize
        ..smoothingTimeConstant = 0.75;

      final source = _audioContext!.createMediaElementSource(_audioElement!);
      source.connectNode(_analyser!);

      _gainNode = _audioContext!.createGain()
        ..gain!.value = _isMuted ? 0.0 : 1.0;
      _analyser!.connectNode(_gainNode!);
      _gainNode!.connectNode(_audioContext!.destination!);

      await _audioElement!.play();

      _pixels.fillRange(0, _pixels.length, 0);
      _lastFrameTime = 0.0;
      _fractionalPixels = 0.0;
      _scheduleFrame();

      setState(() {
        _isLoading = false;
        _isStreaming = true;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = 'Errore: $e';
      });
    }
  }

  void _scheduleFrame() {
    _animFrameId = html.window.requestAnimationFrame(_onFrame);
  }

  void _onFrame(num timestamp) {
    if (!_isStreaming && !_isLoading) return;

    if (_lastFrameTime == 0.0) {
      _lastFrameTime = timestamp.toDouble();
      _scheduleFrame();
      return;
    }

    final deltaMs = timestamp - _lastFrameTime;
    _lastFrameTime = timestamp.toDouble();

    // Limit delta to avoid huge jumps
    if (deltaMs > 0 && deltaMs < 1000 && !_isPaused && _analyser != null) {
      final elapsedSec = deltaMs / 1000.0;
      final pixelsToMoveF = elapsedSec * _pixelsPerSecond;
      _fractionalPixels += pixelsToMoveF;

      final shiftPixels = _fractionalPixels.floor();
      if (shiftPixels > 0) {
        _fractionalPixels -= shiftPixels;

        // Shift the buffer fully to the left by `shiftPixels`
        final w = _spectWidth;
        final h = _spectHeight;
        final rowBytes = w * 4;

        // Obtain new audio data once for the new columns
        final freqData = Uint8List(_analyser!.frequencyBinCount!);
        _analyser!.getByteFrequencyData(freqData);

        for (int y = 0; y < h; y++) {
          final rowStart = y * rowBytes;

          // Move existing pixels
          final shiftBytes = shiftPixels * 4;
          for (int i = rowStart; i < rowStart + rowBytes - shiftBytes; i++) {
            _pixels[i] = _pixels[i + shiftBytes];
          }

          // Fill the new trailing columns with the latest audio reading
          final bin = h - 1 - y;
          final amp = bin < freqData.length ? freqData[bin] : 0;
          final co = amp * 4;
          final r = _colorLUT[co];
          final g = _colorLUT[co + 1];
          final b = _colorLUT[co + 2];

          final newColsStart = rowStart + rowBytes - shiftBytes;
          for (int c = 0; c < shiftPixels; c++) {
            final po = newColsStart + (c * 4);
            _pixels[po] = r;
            _pixels[po + 1] = g;
            _pixels[po + 2] = b;
            _pixels[po + 3] = 255;
          }
        }

        ui.decodeImageFromPixels(_pixels, w, h, ui.PixelFormat.rgba8888, (img) {
          _currentImage?.dispose();
          _currentImage = img;
          _frameCounter.value++;
        });
      }
    }

    _scheduleFrame();
  }

  void _stopWebAudioMode() {
    if (_animFrameId != null) {
      html.window.cancelAnimationFrame(_animFrameId!);
      _animFrameId = null;
    }
    _audioElement?.pause();
    _audioElement = null;
    _audioContext?.close();
    _audioContext = null;
    _analyser = null;
    _gainNode = null;
    if (mounted) setState(() => _isStreaming = false);
  }

  void _toggleMute() {
    setState(() => _isMuted = !_isMuted);
    _gainNode?.gain?.value = _isMuted ? 0.0 : 1.0;
  }

  // ─────────────────────────────────────────────────
  // Build
  // ─────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final hasCredentials = authState.isAuthenticated;

    // Costruisci gli header per l'immagine statica al volo
    Map<String, String>? authHeaders;
    final u = authState.username;
    final p = authState.password;
    if (u != null && u.isNotEmpty && p != null && p.isNotEmpty) {
      final authStr = base64Encode(utf8.encode('$u:$p'));
      authHeaders = {'Authorization': 'Basic $authStr'};
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.spectrogram),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => AppShell.openDrawer(),
        ),
        actions: [
          if (_isStreaming && !_useStaticMode) ...[
            IconButton(
              icon: Icon(
                _isMuted ? Icons.volume_off : Icons.volume_up,
                color: AppColors.primaryLight,
              ),
              tooltip: _isMuted
                  ? AppLocalizations.of(context)!.unmute
                  : AppLocalizations.of(context)!.mute,
              onPressed: _toggleMute,
            ),
          ],
          if (_isStreaming)
            IconButton(
              icon: Icon(
                _isPaused ? Icons.play_arrow : Icons.pause,
                color: AppColors.primaryLight,
              ),
              tooltip: _isPaused
                  ? AppLocalizations.of(context)!.resume
                  : AppLocalizations.of(context)!.pause,
              onPressed: () => setState(() => _isPaused = !_isPaused),
            ),
          if (!_useStaticMode) const AuthLockIcon(),
        ],
      ),
      body: Column(
        children: [
          // Spectrogram display
          Expanded(
            child: Container(
              color: Colors.black,
              child: _isStreaming
                  ? (_useStaticMode
                        ? _buildStaticSpectrogram(authHeaders)
                        : _buildRealtimeSpectrogram())
                  : _buildStartView(hasCredentials),
            ),
          ),

          // Controls bar
          _buildControlBar(hasCredentials),

          // Error bar
          if (_error != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: AppColors.error.withValues(alpha: 0.15),
              child: Text(
                _error!,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.error.withValues(alpha: 0.9),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // ── Static spectrogram (iOS): auto-refreshing image ──
  Widget _buildStaticSpectrogram(Map<String, String>? authHeaders) {
    final url = '${ApiConfig.baseUrl}/spectrogram.png?t=$_imageTimestamp';
    return Center(
      child: AspectRatio(
        aspectRatio: 944.0 / 591.0,
        child: CachedNetworkImage(
          imageUrl: url,
          httpHeaders: authHeaders,
          fit: BoxFit.contain,
          // disable cache so timestamp busting works
          cacheKey: 'spectrogram-$_imageTimestamp',
          placeholder: (_, __) => const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryLight,
              strokeWidth: 2,
            ),
          ),
          errorWidget: (_, __, ___) => const Center(
            child: Icon(Icons.graphic_eq, size: 50, color: AppColors.textHint),
          ),
        ),
      ),
    );
  }

  // ── Real-time spectrogram (desktop): pixel buffer + CustomPainter ──
  Widget _buildRealtimeSpectrogram() {
    return RepaintBoundary(
      child: CustomPaint(
        painter: _SpectrogramPainter(
          repaint: _frameCounter,
          imageGetter: () => _currentImage,
        ),
        size: Size.infinite,
      ),
    );
  }

  Widget _buildControlBar(bool hasCredentials) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(
          top: BorderSide(color: AppColors.divider.withValues(alpha: 0.5)),
        ),
      ),
      child: Row(
        children: [
          // Status indicator
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _isStreaming ? Colors.greenAccent : AppColors.textHint,
              boxShadow: _isStreaming
                  ? [
                      BoxShadow(
                        color: Colors.greenAccent.withValues(alpha: 0.5),
                        blurRadius: 6,
                      ),
                    ]
                  : null,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            _isStreaming ? (_isPaused ? 'PAUSED' : 'LIVE') : 'OFFLINE',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: _isStreaming
                  ? (_isPaused ? AppColors.accent : Colors.greenAccent)
                  : AppColors.textHint,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(width: 12),
          if (_useStaticMode && _isStreaming)
            Text(
              AppLocalizations.of(context)!.autoRefresh,
              style: TextStyle(
                fontSize: 11,
                color: AppColors.textHint.withValues(alpha: 0.7),
              ),
            ),
          const Spacer(),

          if (_isStreaming && !_useStaticMode)
            Text(
              '0 — ${(_audioContext?.sampleRate ?? 44100) ~/ 4} Hz',
              style: const TextStyle(fontSize: 11, color: AppColors.textHint),
            ),

          const Spacer(),

          const Spacer(),

          // Play/Stop button (Only if authenticated)
          if (hasCredentials)
            _isLoading
                ? const SizedBox(
                    width: 36,
                    height: 36,
                    child: CircularProgressIndicator(
                      color: AppColors.primaryLight,
                      strokeWidth: 2.5,
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [AppColors.primary, AppColors.primaryLight],
                      ),
                    ),
                    child: IconButton(
                      icon: Icon(
                        _isStreaming
                            ? Icons.stop_rounded
                            : Icons.play_arrow_rounded,
                      ),
                      color: Colors.white,
                      iconSize: 28,
                      onPressed: _isStreaming ? _stop : _start,
                    ),
                  ),
        ],
      ),
    );
  }

  Widget _buildStartView(bool hasCredentials) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.graphic_eq,
            size: 64,
            color: AppColors.primaryLight.withValues(alpha: 0.4),
          ),
          const SizedBox(height: 20),
          Text(
            AppLocalizations.of(context)!.liveSpectrogram,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _useStaticMode
                ? AppLocalizations.of(context)!.pressPlaySpectrogram
                : (hasCredentials
                      ? AppLocalizations.of(
                          context,
                        )!.pressPlayRealtimeSpectrogram
                      : AppLocalizations.of(context)!.loginThenPlay),
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// Spectrogram painter (desktop only) — single drawImageRect
// ═══════════════════════════════════════════════════════════
class _SpectrogramPainter extends CustomPainter {
  final ui.Image? Function() imageGetter;

  _SpectrogramPainter({required Listenable repaint, required this.imageGetter})
    : super(repaint: repaint);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Offset.zero & size);

    final image = imageGetter();
    if (image == null) return;

    final src = Rect.fromLTWH(
      0,
      0,
      image.width.toDouble(),
      image.height.toDouble(),
    );

    // Stretch width to container size, meaning the buffer always fills horizontal space
    final dst = Rect.fromLTWH(0, 0, size.width, size.height);

    canvas.drawImageRect(
      image,
      src,
      dst,
      Paint()..filterQuality = FilterQuality.high,
    );

    // Guide lines
    final lp = Paint()
      ..color = Colors.white.withValues(alpha: 0.08)
      ..strokeWidth = 0.5;
    for (final f in [0.25, 0.5, 0.75]) {
      final y = size.height * (1 - f);
      canvas.drawLine(Offset(0, y), Offset(size.width, y), lp);
    }
  }

  @override
  bool shouldRepaint(covariant _SpectrogramPainter old) => false;
}
