import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:just_audio/just_audio.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:birdnet_pi_app/l10n/app_localizations.dart';
import '../../config/theme.dart';
import '../../providers/detections_provider.dart';
import '../../providers/wikipedia_provider.dart';
import '../../services/api_service.dart';
import '../../widgets/app_shell.dart';
import '../../widgets/auth_lock_icon.dart';
import '../../widgets/confidence_badge.dart';

class SpeciesScreen extends ConsumerStatefulWidget {
  const SpeciesScreen({super.key});

  @override
  ConsumerState<SpeciesScreen> createState() => _SpeciesScreenState();
}

class _SpeciesScreenState extends ConsumerState<SpeciesScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final speciesAsync = ref.watch(allSpeciesProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.species),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => AppShell.openDrawer(),
        ),
        actions: const [AuthLockIcon()],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: l10n.searchSpecies,
                prefixIcon: const Icon(Icons.search, color: AppColors.textHint),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(
                          Icons.clear,
                          color: AppColors.textHint,
                        ),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _searchQuery = '');
                        },
                      )
                    : null,
                filled: true,
                fillColor: AppColors.cardElevated,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() => _searchQuery = value.toLowerCase());
              },
            ),
          ),
        ),
      ),
      body: speciesAsync.when(
        data: (speciesList) {
          final filteredList = speciesList.where((s) {
            final comName = (s['Com_Name'] ?? '').toString().toLowerCase();
            final sciName = (s['Sci_Name'] ?? '').toString().toLowerCase();
            return comName.contains(_searchQuery) ||
                sciName.contains(_searchQuery);
          }).toList();

          if (filteredList.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.search_off,
                    size: 56,
                    color: AppColors.textHint,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _searchQuery.isEmpty
                        ? l10n.noSpeciesDetected
                        : l10n.noResultsFound,
                    style: const TextStyle(color: AppColors.textSecondary),
                  ),
                ],
              ),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 220,
              mainAxisExtent: 360,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: filteredList.length,
            itemBuilder: (context, index) => SpeciesCard(
              key: ValueKey(filteredList[index]['Sci_Name']),
              species: filteredList[index],
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.primaryLight),
        ),
        error: (e, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, color: AppColors.error, size: 48),
              const SizedBox(height: 8),
              Text(
                l10n.errorMsg(e.toString()),
                style: const TextStyle(color: AppColors.error),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SpeciesCard extends ConsumerStatefulWidget {
  final Map<String, dynamic> species;
  const SpeciesCard({super.key, required this.species});

  @override
  ConsumerState<SpeciesCard> createState() => _SpeciesCardState();
}

class _SpeciesCardState extends ConsumerState<SpeciesCard> {
  final AudioPlayer _player = AudioPlayer();
  bool _isPlayerLoading = false;

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<void> _toggleAudio() async {
    final bestDetectionFile = widget.species['File_Name'];
    if (bestDetectionFile == null) return;

    final api = ref.read(apiServiceProvider);
    final url = api.getAudioUrl(bestDetectionFile);

    try {
      if (_player.playing) {
        await _player.pause();
      } else {
        if (_player.processingState == ProcessingState.idle ||
            _player.processingState == ProcessingState.completed) {
          setState(() => _isPlayerLoading = true);
          await _player.setUrl(url);
          setState(() => _isPlayerLoading = false);
        }
        await _player.play();
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isPlayerLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final sciName = (widget.species['Sci_Name'] ?? 'Unknown').toString();
    final comName = (widget.species['Com_Name'] ?? sciName).toString();
    final occurrences =
        int.tryParse(widget.species['Count']?.toString() ?? '0') ?? 0;
    final maxConfidence =
        (widget.species['MaxConfidence'] as num?)?.toDouble() ?? 0.0;

    final wikiAsync = ref.watch(wikipediaSummaryProvider(sciName));
    final l10n = AppLocalizations.of(context)!;

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. Header: Names
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  sciName,
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 12,
                    color: AppColors.textHint,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // 2. Stats: Detections & Confidence
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: Row(
              children: [
                // Emphasized detection count
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.sensors,
                      size: 14,
                      color: AppColors.primaryLight,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'n. $occurrences',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryLight,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                ConfidenceBadge(confidence: maxConfidence),
              ],
            ),
          ),

          // 3. Image area - Squared and Centered
          AspectRatio(
            aspectRatio: 1.0,
            child: GestureDetector(
              onTap: () => _showSpeciesDetail(
                context,
                sciName,
                comName,
                occurrences,
                maxConfidence,
              ),
              child: wikiAsync.when(
                data: (wiki) {
                  if (wiki != null && wiki['thumbnail'] != null) {
                    return CachedNetworkImage(
                      imageUrl: wiki['thumbnail'],
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      width: double.infinity,
                      placeholder: (_, __) => Container(
                        color: AppColors.cardElevated,
                        child: const Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                      errorWidget: (_, __, ___) => _defaultImage(),
                    );
                  }
                  return _defaultImage();
                },
                loading: () => Container(
                  color: AppColors.cardElevated,
                  child: const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
                error: (_, __) => _defaultImage(),
              ),
            ),
          ),

          const Spacer(),
          // 4. Audio Player Control
          if (widget.species['File_Name'] != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder<PlayerState>(
                stream: _player.playerStateStream,
                builder: (context, snapshot) {
                  final playerState = snapshot.data;
                  final playing = playerState?.playing ?? false;

                  return InkWell(
                    onTap: _toggleAudio,
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (_isPlayerLoading)
                            const SizedBox(
                              width: 14,
                              height: 14,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppColors.primaryLight,
                              ),
                            )
                          else
                            Icon(
                              playing
                                  ? Icons.pause_rounded
                                  : Icons.play_arrow_rounded,
                              size: 16,
                              color: AppColors.primaryLight,
                            ),
                          const SizedBox(width: 4),
                          Text(
                            playing ? l10n.pause : l10n.play,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryLight,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _defaultImage() {
    return Container(
      color: AppColors.cardElevated,
      child: const Center(
        child: Icon(Icons.flutter_dash, size: 40, color: AppColors.textHint),
      ),
    );
  }

  void _showSpeciesDetail(
    BuildContext context,
    String sciName,
    String comName,
    int count,
    double maxConf,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => _SpeciesDetailSheet(
        sciName: sciName,
        comName: comName,
        count: count,
        maxConf: maxConf,
      ),
    );
  }
}

class _SpeciesDetailSheet extends ConsumerWidget {
  final String sciName;
  final String comName;
  final int count;
  final double maxConf;

  const _SpeciesDetailSheet({
    required this.sciName,
    required this.comName,
    required this.count,
    required this.maxConf,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wikiAsync = ref.watch(wikipediaSummaryProvider(sciName));
    final l10n = AppLocalizations.of(context)!;
    final screenHeight = MediaQuery.of(context).size.height;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: screenHeight * 0.9),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 40),
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

          Text(
            comName,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            sciName,
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              color: AppColors.textSecondary,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),

          // Stats
          Row(
            children: [
              _statItem(Icons.sensors, l10n.detections, count.toString()),
              const SizedBox(width: 10),
              _statItem(
                Icons.analytics,
                l10n.maxConfidence,
                '${(maxConf * 100).toStringAsFixed(0)}%',
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Wikipedia Content
          wikiAsync.when(
            data: (wiki) {
              if (wiki == null) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Text(
                      l10n.noWikipediaInfo,
                      style: const TextStyle(color: AppColors.textSecondary),
                    ),
                  ),
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (wiki['thumbnail'] != null)
                    Center(
                      child: AspectRatio(
                        aspectRatio: 1.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: CachedNetworkImage(
                            imageUrl: wiki['thumbnail'],
                            width: double.infinity,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 10),
                  Text(
                    wiki['extract'] ?? '',
                    style: const TextStyle(fontSize: 15, height: 1.5),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      final url = wiki['content_urls'];
                      if (url != null) {
                        launchUrl(
                          Uri.parse(url),
                          mode: LaunchMode.externalApplication,
                        );
                      }
                    },
                    icon: const Icon(Icons.open_in_new),
                    label: Text(l10n.readOnWikipedia),
                  ),
                ],
              );
            },
            loading: () => Center(
              child: Column(
                children: [
                  const CircularProgressIndicator(
                    color: AppColors.primaryLight,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    l10n.loadingWikipedia,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textHint,
                    ),
                  ),
                ],
              ),
            ),
            error: (e, _) => Text('Error: $e'),
          ),
        ],
      ),
    );
  }

  Widget _statItem(IconData icon, String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.divider),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.primaryLight, size: 20),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              label,
              style: const TextStyle(fontSize: 10, color: AppColors.textHint),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
