import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:birdnet_pi_app/l10n/app_localizations.dart';
import '../../config/theme.dart';
import '../../providers/auth_provider.dart';
import '../../services/api_service.dart';
import '../../widgets/app_shell.dart';
import '../../widgets/auth_lock_icon.dart';

class LiveStreamScreen extends ConsumerStatefulWidget {
  const LiveStreamScreen({super.key});

  @override
  ConsumerState<LiveStreamScreen> createState() => _LiveStreamScreenState();
}

class _LiveStreamScreenState extends ConsumerState<LiveStreamScreen> {
  late final AudioPlayer _player;
  bool _isLoading = false;
  bool _isStarted = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<void> _startStream() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });
      final api = ref.read(apiServiceProvider);
      final url = await api.getLiveStreamUrl();
      await _player.setUrl(url);
      _player.play();
      setState(() {
        _isLoading = false;
        _isStarted = true;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = e.toString();
      });
    }
  }

  Future<void> _stopStream() async {
    await _player.stop();
    setState(() => _isStarted = false);
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final hasCredentials = authState.isAuthenticated;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.liveStream),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => AppShell.openDrawer(),
        ),
        actions: const [AuthLockIcon()],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated icon
              StreamBuilder<PlayerState>(
                stream: _player.playerStateStream,
                builder: (context, snapshot) {
                  final playing = snapshot.data?.playing ?? false;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    width: playing ? 160 : 140,
                    height: playing ? 160 : 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: playing
                            ? [
                                AppColors.primaryLight.withValues(alpha: 0.3),
                                AppColors.primary.withValues(alpha: 0.1),
                                Colors.transparent,
                              ]
                            : [
                                AppColors.cardElevated,
                                AppColors.card,
                                Colors.transparent,
                              ],
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: playing
                              ? AppColors.primary.withValues(alpha: 0.2)
                              : AppColors.card,
                          border: Border.all(
                            color: playing
                                ? AppColors.primaryLight.withValues(alpha: 0.4)
                                : AppColors.divider,
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          playing ? Icons.hearing : Icons.hearing_disabled,
                          size: 48,
                          color: playing
                              ? AppColors.primaryLight
                              : AppColors.textHint,
                        ),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 32),

              // Status text
              StreamBuilder<PlayerState>(
                stream: _player.playerStateStream,
                builder: (context, snapshot) {
                  final playing = snapshot.data?.playing ?? false;
                  return Column(
                    children: [
                      Text(
                        playing
                            ? AppLocalizations.of(context)!.liveStream
                            : AppLocalizations.of(context)!.audioStream,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (playing) ...[
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Colors.greenAccent,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'LIVE',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Colors.greenAccent,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ] else
                            Text(
                              hasCredentials
                                  ? AppLocalizations.of(
                                      context,
                                    )!.pressPlayToListen
                                  : AppLocalizations.of(context)!.loginToStart,
                              style: const TextStyle(
                                fontSize: 13,
                                color: AppColors.textSecondary,
                              ),
                            ),
                        ],
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 40),

              // Error message
              if (_error != null)
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.error.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.error.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: AppColors.error,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _error!,
                          style: TextStyle(
                            color: AppColors.error.withValues(alpha: 0.9),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              // Credentials hint if none configured
              if (!hasCredentials && _error == null)
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.primaryLight.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        color: AppColors.primaryLight,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context)!.streamRequiresAuth,
                          style: TextStyle(
                            color: AppColors.primaryLight.withValues(
                              alpha: 0.9,
                            ),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              // Player controls
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.primaryLight.withValues(alpha: 0.15),
                  ),
                ),
                child: hasCredentials
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Stop button
                          StreamBuilder<PlayerState>(
                            stream: _player.playerStateStream,
                            builder: (context, snapshot) {
                              final playing = snapshot.data?.playing ?? false;
                              return IconButton(
                                icon: const Icon(Icons.stop_rounded),
                                color: playing
                                    ? AppColors.textSecondary
                                    : AppColors.textHint,
                                iconSize: 36,
                                onPressed: playing ? _stopStream : null,
                              );
                            },
                          ),
                          const SizedBox(width: 24),

                          // Play / Loading button
                          _isLoading
                              ? Container(
                                  width: 72,
                                  height: 72,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.primaryLight.withValues(
                                      alpha: 0.15,
                                    ),
                                  ),
                                  child: const Center(
                                    child: SizedBox(
                                      width: 32,
                                      height: 32,
                                      child: CircularProgressIndicator(
                                        color: AppColors.primaryLight,
                                        strokeWidth: 3,
                                      ),
                                    ),
                                  ),
                                )
                              : StreamBuilder<PlayerState>(
                                  stream: _player.playerStateStream,
                                  builder: (context, snapshot) {
                                    final playing =
                                        snapshot.data?.playing ?? false;
                                    return Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            AppColors.primary,
                                            AppColors.primaryLight,
                                          ],
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.primaryLight
                                                .withValues(alpha: 0.4),
                                            blurRadius: 16,
                                            offset: const Offset(0, 6),
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
                                        iconSize: 40,
                                        padding: const EdgeInsets.all(16),
                                        onPressed: playing
                                            ? () => _player.pause()
                                            : _startStream,
                                      ),
                                    );
                                  },
                                ),
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Text(
                          AppLocalizations.of(context)!.loginThenPlay,
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
              ),

              const SizedBox(height: 24),

              // Info text
              Text(
                AppLocalizations.of(context)!.liveAudioFootnote,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textHint.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
