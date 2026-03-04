import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:birdnet_pi_app/l10n/app_localizations.dart';
import '../../config/theme.dart';
import '../../providers/detections_provider.dart';
import '../../widgets/app_shell.dart';
import '../../widgets/auth_lock_icon.dart';

class SpeciesScreen extends ConsumerWidget {
  const SpeciesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detectionsAsync = ref.watch(todayDetectionsFlatProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.species),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => AppShell.openDrawer(),
        ),
        actions: [
          const AuthLockIcon(),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _showSearch(context, ref),
          ),
        ],
      ),
      body: detectionsAsync.when(
        data: (detections) {
          // Aggregate by species
          final speciesMap = <String, _SpeciesAgg>{};
          for (final d in detections) {
            speciesMap.putIfAbsent(
              d.scientificName,
              () => _SpeciesAgg(
                commonName: d.commonName,
                scientificName: d.scientificName,
              ),
            );
            speciesMap[d.scientificName]!.count++;
            if (d.confidence > speciesMap[d.scientificName]!.maxConfidence) {
              speciesMap[d.scientificName]!.maxConfidence = d.confidence;
            }
          }

          final speciesList = speciesMap.values.toList()
            ..sort((a, b) => b.count.compareTo(a.count));

          if (speciesList.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.pets, size: 56, color: AppColors.textHint),
                  const SizedBox(height: 12),
                  Text(
                    AppLocalizations.of(context)!.noSpeciesDetected,
                    style: const TextStyle(color: AppColors.textSecondary),
                  ),
                ],
              ),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.85,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: speciesList.length,
            itemBuilder: (context, index) =>
                _buildSpeciesCard(context, speciesList[index], ref),
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
                AppLocalizations.of(context)!.errorMsg(e.toString()),
                style: const TextStyle(color: AppColors.error),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSpeciesCard(
    BuildContext context,
    _SpeciesAgg species,
    WidgetRef ref,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      child: InkWell(
        onTap: () => _showSpeciesDetail(context, species),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon & count
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primary.withValues(alpha: 0.3),
                          AppColors.primaryLight.withValues(alpha: 0.15),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.flutter_dash,
                      color: AppColors.primaryLight,
                      size: 24,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${species.count}',
                      style: const TextStyle(
                        color: AppColors.primaryLight,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              // Name
              Text(
                species.commonName,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: AppColors.textPrimary,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                species.scientificName,
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 11,
                  color: AppColors.textHint,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              // Confidence bar
              Row(
                children: [
                  Text(
                    '${AppLocalizations.of(context)!.max} ',
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.textHint,
                    ),
                  ),
                  Text(
                    '${(species.maxConfidence * 100).toStringAsFixed(0)}%',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: species.maxConfidence >= 0.8
                          ? AppColors.confidenceHigh
                          : species.maxConfidence >= 0.5
                          ? AppColors.confidenceMedium
                          : AppColors.confidenceLow,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: species.maxConfidence,
                  color: species.maxConfidence >= 0.8
                      ? AppColors.confidenceHigh
                      : species.maxConfidence >= 0.5
                      ? AppColors.confidenceMedium
                      : AppColors.confidenceLow,
                  backgroundColor: AppColors.divider,
                  minHeight: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSpeciesDetail(BuildContext context, _SpeciesAgg species) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surface,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Icons.flutter_dash,
                    color: AppColors.primaryLight,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        species.commonName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        species.scientificName,
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                _detailStat(
                  AppLocalizations.of(context)!.detections,
                  '${species.count}',
                  Icons.sensors,
                ),
                const SizedBox(width: 12),
                _detailStat(
                  AppLocalizations.of(context)!.maxConfidence,
                  '${(species.maxConfidence * 100).toStringAsFixed(0)}%',
                  Icons.analytics,
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _detailStat(String label, String value, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.primaryLight, size: 20),
            const SizedBox(height: 6),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryLight,
              ),
            ),
            Text(
              label,
              style: const TextStyle(fontSize: 11, color: AppColors.textHint),
            ),
          ],
        ),
      ),
    );
  }

  void _showSearch(BuildContext context, WidgetRef ref) {
    showSearch(context: context, delegate: _SpeciesSearchDelegate(ref));
  }
}

class _SpeciesAgg {
  final String commonName;
  final String scientificName;
  int count = 0;
  double maxConfidence = 0;

  _SpeciesAgg({required this.commonName, required this.scientificName});
}

class _SpeciesSearchDelegate extends SearchDelegate<String> {
  final WidgetRef ref;

  _SpeciesSearchDelegate(this.ref);

  @override
  String get searchFieldLabel =>
      AppLocalizations.of(ref.context)!.searchSpeciesStr; // We will handle translation in the delegate where context is available

  @override
  ThemeData appBarTheme(BuildContext context) => Theme.of(context).copyWith(
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.surface),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      hintStyle: TextStyle(color: AppColors.textHint),
    ),
  );

  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(icon: const Icon(Icons.clear), onPressed: () => query = ''),
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () => close(context, ''),
  );

  @override
  Widget buildResults(BuildContext context) => _buildList(context);

  @override
  Widget buildSuggestions(BuildContext context) => _buildList(context);

  Widget _buildList(BuildContext context) {
    final detectionsAsync = ref.watch(todayDetectionsFlatProvider);
    return detectionsAsync.when(
      data: (detections) {
        final species = <String>{};
        for (final d in detections) {
          if (query.isEmpty ||
              d.commonName.toLowerCase().contains(query.toLowerCase()) ||
              d.scientificName.toLowerCase().contains(query.toLowerCase())) {
            species.add('${d.commonName} (${d.scientificName})');
          }
        }
        final list = species.toList()..sort();
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, i) => ListTile(
            leading: const Icon(
              Icons.flutter_dash,
              color: AppColors.primaryLight,
            ),
            title: Text(list[i]),
            onTap: () => close(context, list[i]),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, trace) =>
          Center(child: Text(AppLocalizations.of(context)!.error)),
    );
  }
}
