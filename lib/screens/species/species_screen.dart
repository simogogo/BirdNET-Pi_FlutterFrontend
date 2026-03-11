import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:birdnet_pi_app/l10n/app_localizations.dart';
import '../../config/theme.dart';
import '../../providers/detections_provider.dart';
import '../../widgets/app_shell.dart';
import '../../widgets/auth_lock_icon.dart';
import '../../widgets/confidence_badge.dart';
import '../../widgets/species_detail_sheet.dart';

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
        title: Text(l10n.mySpecies),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => AppShell.openDrawer(),
        ),
        actions: const [AuthLockIcon()],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: l10n.searchSpecies,
                prefixIcon: Icon(Icons.search, color: AppColors.textHint),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: Icon(
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
                  Icon(
                    Icons.search_off,
                    size: 56,
                    color: AppColors.textHint,
                  ),
                  SizedBox(height: 12),
                  Text(
                    _searchQuery.isEmpty
                        ? l10n.noSpeciesDetected
                        : l10n.noResultsFound,
                    style: TextStyle(color: AppColors.textSecondary),
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
        loading: () => Center(
          child: CircularProgressIndicator(color: AppColors.primaryLight),
        ),
        error: (e, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.error_outline, color: AppColors.error, size: 48),
              SizedBox(height: 8),
              Text(
                l10n.errorMsg(e.toString()),
                style: TextStyle(color: AppColors.error),
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
  @override
  Widget build(BuildContext context) {
    final sciName = (widget.species['Sci_Name'] ?? 'Unknown').toString();
    final comName = (widget.species['Com_Name'] ?? sciName).toString();
    final occurrences =
        int.tryParse(widget.species['Count']?.toString() ?? '0') ?? 0;
    final maxConfidence =
        (widget.species['MaxConfidence'] as num?)?.toDouble() ?? 0.0;

    final imageAsync = ref.watch(speciesImageProvider(sciName));
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
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  sciName,
                  style: TextStyle(
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
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: Row(
              children: [
                // Emphasized detection count
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.sensors,
                      size: 14,
                      color: AppColors.primaryLight,
                    ),
                    SizedBox(width: 4),
                    Text(
                      l10n.occurrenceCount(occurrences),
                      style: TextStyle(
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
              child: imageAsync.when(
                data: (imageMap) {
                  final base64String = imageMap?['base64_data'] as String?;
                  final imageUrl = imageMap?['image_url'] as String?;

                  if (base64String != null && base64String.isNotEmpty) {
                    try {
                      final bytes = base64Decode(base64String.split(',').last);
                      return MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Image.memory(
                          bytes,
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          width: double.infinity,
                          errorBuilder: (_, _, _) => _defaultImage(),
                        ),
                      );
                    } catch (e) {
                      debugPrint('Error decoding base64 image: $e');
                    }
                  }

                  if (imageUrl != null && imageUrl.isNotEmpty) {
                    return MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        width: double.infinity,
                        placeholder: (_, _) => Container(
                          color: AppColors.cardElevated,
                          child: const Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                        errorWidget: (_, _, _) => _defaultImage(),
                      ),
                    );
                  }
                  return MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: _defaultImage(),
                  );
                },
                loading: () => MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    color: AppColors.cardElevated,
                    child: const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                ),
                error: (context, error) => MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: _defaultImage(),
                ),
              ),
            ),
          ),
          // (Audio Player Control removed from here, moved to Detail Sheet)
        ],
      ),
    );
  }

  Widget _defaultImage() {
    return Container(
      color: AppColors.cardElevated,
      child: Image.asset(
        'assets/images/no-image.png',
        fit: BoxFit.cover,
        width: double.infinity,
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
    showSpeciesDetailSheet(
      context,
      sciName: sciName,
      comName: comName,
      showImage: true,
    );
  }
}

