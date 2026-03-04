import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:just_audio/just_audio.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:birdnet_pi_app/l10n/app_localizations.dart';
import '../config/theme.dart';
import '../services/api_service.dart';
import '../utils/labels_helper.dart';
import '../providers/auth_provider.dart';
import '../providers/database_lang_provider.dart';
import '../models/detection.dart';
import 'confidence_badge.dart';

/// Pannello dettaglio detection riutilizzabile.
/// Mostra spettrogramma, player audio e azioni (elimina, cambia ID, proteggi, scarica).
class DetectionDetailSheet extends ConsumerStatefulWidget {
  final dynamic detection;
  final String audioUrl;
  final String spectrogramUrl;
  final ApiService apiService;
  final VoidCallback? onDeleted;
  final VoidCallback? onChanged;

  const DetectionDetailSheet({
    super.key,
    required this.detection,
    required this.audioUrl,
    required this.spectrogramUrl,
    required this.apiService,
    this.onDeleted,
    this.onChanged,
  });

  @override
  ConsumerState<DetectionDetailSheet> createState() =>
      _DetectionDetailSheetState();
}

class _DetectionDetailSheetState extends ConsumerState<DetectionDetailSheet> {
  late final AudioPlayer _player;
  bool _isLoading = false;
  bool _isLocked = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    if (widget.detection is Detection) {
      _isLocked = (widget.detection as Detection).isLocked;
    } else if (widget.detection is Map) {
      _isLocked = widget.detection['is_locked'] == true;
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<void> _playPause() async {
    try {
      if (_player.playing) {
        await _player.pause();
      } else {
        if (_player.processingState == ProcessingState.idle ||
            _player.processingState == ProcessingState.completed) {
          setState(() {
            _isLoading = true;
            _error = null;
          });
          await _player.setUrl(widget.audioUrl);
          setState(() => _isLoading = false);
        }
        await _player.play();
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = e.toString();
      });
    }
  }

  Future<void> _stop() async {
    await _player.stop();
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  // ─── Action: Elimina ─────────────────────────────────────
  Future<void> _deleteRecording() async {
    final authState = ref.read(authProvider);
    final l10n = AppLocalizations.of(context)!;

    if (!authState.isAuthenticated) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.loginRequired),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    final detection = widget.detection;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: Text(l10n.deleteRecording),
        content: Text(
          l10n.deleteRecordingConfirmation(
            detection.commonName,
            detection.date,
            detection.time,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );

    if (confirmed != true || !mounted) return;

    final success = await widget.apiService.deleteRecording(detection.fileName);
    if (!mounted) return;

    if (success) {
      Navigator.pop(context);
      widget.onDeleted?.call();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.deleteRecording),
          backgroundColor: AppColors.success,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.errorOccurred),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  // ─── Action: Cambia ID ───────────────────────────────────
  Future<void> _changeId() async {
    final authState = ref.read(authProvider);
    final l10n = AppLocalizations.of(context)!;

    if (!authState.isAuthenticated) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.loginRequired),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    final detection = widget.detection;

    // Carica la lista di specie dal file labels localizzato
    List<String> labels = [];
    try {
      final languageCode = await ref.read(databaseLangProvider.future);
      final String content = await rootBundle.loadString(
        labelsAssetPath(languageCode),
      );
      labels = const LineSplitter()
          .convert(content)
          .where((line) => line.trim().isNotEmpty)
          .toList();
    } catch (e) {
      debugPrint('Errore caricamento labels: $e');
    }

    if (!mounted) return;

    final newName = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => _SpeciesSearchSheet(
        labels: labels,
        currentName: detection.commonName,
      ),
    );

    if (newName == null || newName.isEmpty || newName == detection.commonName) {
      return;
    }
    if (!mounted) return;

    final success = await widget.apiService.changeRecordingId(
      detection.fileName,
      newName,
    );
    if (!mounted) return;

    if (success) {
      Navigator.pop(context);
      widget.onChanged?.call();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${l10n.changeId}: ${_formatLabel(newName)}'),
          backgroundColor: AppColors.success,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.errorOccurred),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  String _formatLabel(String rawName) {
    if (rawName.contains('_')) {
      final parts = rawName.split('_');
      if (parts.length >= 2) {
        return '${parts.sublist(1).join('_')} (${parts[0]})';
      }
    }
    return rawName;
  }

  // ─── Action: Proteggi / Sblocca ──────────────────────────
  Future<void> _toggleProtect() async {
    final authState = ref.read(authProvider);
    final l10n = AppLocalizations.of(context)!;

    if (!authState.isAuthenticated) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.loginRequired),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    final detection = widget.detection;
    final newLock = !_isLocked;

    final success = await widget.apiService.toggleFileLock(
      detection.fileName,
      newLock,
    );
    if (!mounted) return;

    if (success) {
      setState(() => _isLocked = newLock);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(newLock ? l10n.protect : l10n.download),
          backgroundColor: AppColors.success,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.errorOccurred),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  // ─── Action: Scarica ─────────────────────────────────────
  Future<void> _downloadRecording() async {
    final l10n = AppLocalizations.of(context)!;
    final detection = widget.detection;

    try {
      // Usa un anchor element con attributo download per scaricare il file
      final fileName = detection.fileName;
      html.AnchorElement(href: widget.audioUrl)
        ..setAttribute('download', fileName)
        ..click();
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.cannotDownloadFile),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final detection = widget.detection;
    final l10n = AppLocalizations.of(context)!;

    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      maxChildSize: 0.92,
      minChildSize: 0.5,
      expand: false,
      builder: (_, controller) => ListView(
        controller: controller,
        padding: const EdgeInsets.all(20),
        children: [
          // Drag handle
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.divider,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Species name
          Text(
            detection.commonName,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            detection.scientificName,
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              color: AppColors.textSecondary,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),

          // Confidence + date/time
          Row(
            children: [
              ConfidenceBadge(confidence: detection.confidence),
              const SizedBox(width: 12),
              const Icon(
                Icons.calendar_today,
                size: 14,
                color: AppColors.textHint,
              ),
              const SizedBox(width: 4),
              Text(
                detection.date,
                style: const TextStyle(color: AppColors.textSecondary),
              ),
              const SizedBox(width: 12),
              const Icon(
                Icons.access_time,
                size: 14,
                color: AppColors.textHint,
              ),
              const SizedBox(width: 4),
              Text(
                detection.time,
                style: const TextStyle(color: AppColors.textSecondary),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Spectrogram
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              color: AppColors.cardElevated,
              child: AspectRatio(
                aspectRatio: 944.0 / 591.0,
                child: CachedNetworkImage(
                  imageUrl: widget.spectrogramUrl,
                  width: double.infinity,
                  fit: BoxFit.contain,
                  errorWidget: (_, _, _) => Container(
                    color: AppColors.card,
                    child: const Center(
                      child: Icon(
                        Icons.graphic_eq,
                        size: 50,
                        color: AppColors.textHint,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // ═══ Action Buttons ═══════════════════════════════
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.primaryLight.withValues(alpha: 0.12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _ActionButton(
                  icon: Icons.delete_outline,
                  label: l10n.delete,
                  color: AppColors.error,
                  onTap: _deleteRecording,
                ),
                _ActionButton(
                  icon: Icons.swap_horiz,
                  label: l10n.changeId,
                  color: AppColors.primaryLight,
                  onTap: _changeId,
                ),
                _ActionButton(
                  icon: _isLocked ? Icons.lock : Icons.lock_open,
                  label: l10n.protect,
                  color: _isLocked ? AppColors.accent : AppColors.textSecondary,
                  onTap: _toggleProtect,
                ),
                _ActionButton(
                  icon: Icons.download,
                  label: l10n.download,
                  color: AppColors.primaryLight,
                  onTap: _downloadRecording,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Audio Player
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.primaryLight.withValues(alpha: 0.15),
              ),
            ),
            child: Column(
              children: [
                // File info row
                Row(
                  children: [
                    const Icon(Icons.audio_file, color: AppColors.primaryLight),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.audioFile,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            detection.fileName,
                            style: const TextStyle(
                              fontSize: 11,
                              color: AppColors.textHint,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Progress bar
                StreamBuilder<Duration>(
                  stream: _player.positionStream,
                  builder: (context, posSnap) {
                    final position = posSnap.data ?? Duration.zero;
                    final duration = _player.duration ?? Duration.zero;
                    final progress = duration.inMilliseconds > 0
                        ? position.inMilliseconds / duration.inMilliseconds
                        : 0.0;

                    return Column(
                      children: [
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: AppColors.primaryLight,
                            inactiveTrackColor: AppColors.primaryLight
                                .withValues(alpha: 0.2),
                            thumbColor: AppColors.primaryLight,
                            thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 6,
                            ),
                            trackHeight: 3,
                            overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 14,
                            ),
                          ),
                          child: Slider(
                            value: progress.clamp(0.0, 1.0),
                            onChanged: duration.inMilliseconds > 0
                                ? (v) {
                                    _player.seek(
                                      Duration(
                                        milliseconds:
                                            (v * duration.inMilliseconds)
                                                .toInt(),
                                      ),
                                    );
                                  }
                                : null,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _formatDuration(position),
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: AppColors.textHint,
                                ),
                              ),
                              Text(
                                _formatDuration(duration),
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: AppColors.textHint,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 8),

                // Playback controls
                if (_error != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      _error!,
                      style: const TextStyle(
                        color: AppColors.error,
                        fontSize: 11,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Stop
                    IconButton(
                      icon: const Icon(Icons.stop_rounded),
                      color: AppColors.textSecondary,
                      iconSize: 32,
                      onPressed: _stop,
                    ),
                    const SizedBox(width: 16),
                    // Play/Pause
                    StreamBuilder<PlayerState>(
                      stream: _player.playerStateStream,
                      builder: (context, snapshot) {
                        final playerState = snapshot.data;
                        final playing = playerState?.playing ?? false;

                        if (_isLoading) {
                          return Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primaryLight.withValues(
                                alpha: 0.15,
                              ),
                            ),
                            child: const Center(
                              child: SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  color: AppColors.primaryLight,
                                  strokeWidth: 2,
                                ),
                              ),
                            ),
                          );
                        }

                        return Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                AppColors.primary,
                                AppColors.primaryLight,
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primaryLight.withValues(
                                  alpha: 0.3,
                                ),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: IconButton(
                            icon: Icon(
                              playing
                                  ? Icons.pause_rounded
                                  : Icons.play_arrow_rounded,
                            ),
                            color: Colors.white,
                            iconSize: 32,
                            onPressed: _playPause,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// Pulsante azione compatto
// ═══════════════════════════════════════════════════════════

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 22),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// Sheet di ricerca specie per Cambia ID
// ═══════════════════════════════════════════════════════════

class _SpeciesSearchSheet extends StatefulWidget {
  final List<String> labels;
  final String currentName;

  const _SpeciesSearchSheet({required this.labels, required this.currentName});

  @override
  State<_SpeciesSearchSheet> createState() => _SpeciesSearchSheetState();
}

class _SpeciesSearchSheetState extends State<_SpeciesSearchSheet> {
  final _controller = TextEditingController();
  List<String> _filtered = [];

  @override
  void initState() {
    super.initState();
    _filtered = [];
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _filter(String query) {
    final lowerQuery = query.toLowerCase();
    setState(() {
      if (lowerQuery.isEmpty) {
        _filtered = [];
      } else {
        _filtered = widget.labels.where((label) {
          return label.toLowerCase().contains(lowerQuery) ||
              _formatLabel(label).toLowerCase().contains(lowerQuery);
        }).toList();
      }
    });
  }

  String _formatLabel(String rawName) {
    if (rawName.contains('_')) {
      final parts = rawName.split('_');
      if (parts.length >= 2) {
        final latin = parts[0];
        final common = parts.sublist(1).join(' ');
        return '$common ($latin)';
      }
    }
    return rawName;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: Column(
          children: [
            // Handle
            const SizedBox(height: 12),
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.divider,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Icon(Icons.swap_horiz, color: AppColors.primaryLight),
                  const SizedBox(width: 12),
                  Text(
                    l10n.changeId,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Search field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _controller,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: l10n.searchSpecies,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.textHint,
                  ),
                  suffixIcon: _controller.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(
                            Icons.clear,
                            color: AppColors.textHint,
                          ),
                          onPressed: () {
                            _controller.clear();
                            _filter('');
                          },
                        )
                      : null,
                  filled: true,
                  fillColor: AppColors.card,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: _filter,
              ),
            ),
            const SizedBox(height: 8),
            // Results
            Expanded(
              child: _controller.text.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.search,
                            size: 48,
                            color: AppColors.textHint.withValues(alpha: 0.5),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            l10n.searchSpecies,
                            style: const TextStyle(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    )
                  : _filtered.isEmpty
                  ? Center(
                      child: Text(
                        l10n.noSpeciesFound,
                        style: const TextStyle(color: AppColors.textSecondary),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      itemCount: _filtered.length,
                      itemBuilder: (context, index) {
                        final label = _filtered[index];
                        final formatted = _formatLabel(label);
                        final isCurrentSpecies =
                            label.contains(widget.currentName) ||
                            formatted.contains(widget.currentName);

                        return ListTile(
                          dense: true,
                          leading: Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: isCurrentSpecies
                                  ? AppColors.primaryLight.withValues(
                                      alpha: 0.2,
                                    )
                                  : AppColors.card,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              isCurrentSpecies
                                  ? Icons.check_circle
                                  : Icons.pets,
                              color: isCurrentSpecies
                                  ? AppColors.primaryLight
                                  : AppColors.textHint,
                              size: 18,
                            ),
                          ),
                          title: Text(
                            formatted,
                            style: TextStyle(
                              fontWeight: isCurrentSpecies
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          onTap: () => Navigator.pop(context, label),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
