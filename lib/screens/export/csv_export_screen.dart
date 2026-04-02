import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../l10n/app_localizations.dart';
import '../../config/theme.dart';
import '../../providers/detections_provider.dart';
import '../../config/api_config.dart';

class CsvExportScreen extends ConsumerStatefulWidget {
  const CsvExportScreen({super.key});

  @override
  ConsumerState<CsvExportScreen> createState() => _CsvExportScreenState();
}

class _CsvExportScreenState extends ConsumerState<CsvExportScreen> {
  DateTime _fromDate = DateTime.now().subtract(const Duration(days: 7));
  DateTime _toDate = DateTime.now();
  final List<Map<String, dynamic>> _selectedSpeciesList = [];
  final TextEditingController _searchController = TextEditingController();

  Future<void> _pickFromDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _fromDate,
      firstDate: DateTime(2000),
      lastDate: _toDate,
    );
    if (date != null) {
      setState(() => _fromDate = date);
    }
  }

  Future<void> _pickToDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _toDate,
      firstDate: _fromDate,
      lastDate: DateTime.now(),
    );
    if (date != null) {
      setState(() => _toDate = date);
    }
  }

  Future<void> _downloadCsv() async {
    final serverUrl = ApiConfig.baseUrl; // Using static for web
    final from = DateFormat('yyyy-MM-dd').format(_fromDate);
    final to = DateFormat('yyyy-MM-dd').format(_toDate);
    
    final speciesParam = _selectedSpeciesList.map((s) => s['Sci_Name'].toString()).join(',');
    
    var urlStr = '$serverUrl/api/v2/export/csv?from_date=$from&to_date=$to';
    if (speciesParam.isNotEmpty) {
      urlStr += '&species=${Uri.encodeComponent(speciesParam)}';
    }
    
    var uri = Uri.parse(urlStr);
    if (kIsWeb && !uri.hasScheme) {
      uri = Uri.base.resolve(urlStr);
    }
    
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.errorOccurred),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final allSpeciesAsync = ref.watch(allSpeciesProvider);
    final formattedFrom = DateFormat('yyyy-MM-dd').format(_fromDate);
    final formattedTo = DateFormat('yyyy-MM-dd').format(_toDate);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.csvExport),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: _pickFromDate,
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: AppColors.card,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.divider),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(l10n.startDate, style: TextStyle(fontSize: 12, color: AppColors.textHint)),
                              const SizedBox(height: 4),
                              Text(formattedFrom, style: const TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: InkWell(
                        onTap: _pickToDate,
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: AppColors.card,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.divider),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(l10n.endDate, style: TextStyle(fontSize: 12, color: AppColors.textHint)),
                              const SizedBox(height: 4),
                              Text(formattedTo, style: const TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                
                Text(
                  l10n.filterSpecies,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                allSpeciesAsync.when(
                  data: (speciesList) {
                    return Autocomplete<Map<String, dynamic>>(
                      displayStringForOption: (option) => option['Com_Name'] ?? option['Sci_Name'],
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text.isEmpty) {
                          return const Iterable<Map<String, dynamic>>.empty();
                        }
                        final query = textEditingValue.text.toLowerCase();
                        return speciesList.where((s) {
                          final common = (s['Com_Name'] as String?)?.toLowerCase() ?? '';
                          final scientific = (s['Sci_Name'] as String?)?.toLowerCase() ?? '';
                          final alreadySelected = _selectedSpeciesList.any((sel) => sel['Sci_Name'] == s['Sci_Name']);
                          if (alreadySelected) return false;
                          
                          return common.contains(query) || scientific.contains(query);
                        });
                      },
                      onSelected: (Map<String, dynamic> selection) {
                        setState(() {
                          _selectedSpeciesList.add(selection);
                          _searchController.clear();
                        });
                      },
                      fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
                        return TextField(
                          controller: controller,
                          focusNode: focusNode,
                          decoration: InputDecoration(
                            hintText: l10n.searchSpeciesHint,
                            prefixIcon: Icon(Icons.search, color: AppColors.textHint),
                            filled: true,
                            fillColor: AppColors.card,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: AppColors.divider),
                            ),
                          ),
                        );
                      },
                      optionsViewBuilder: (context, onSelected, options) {
                        return Align(
                          alignment: Alignment.topLeft,
                          child: Material(
                            elevation: 8,
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.surface,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: 250,
                                maxWidth: MediaQuery.of(context).size.width - 32,
                              ),
                              child: ListView.separated(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: options.length,
                                separatorBuilder: (context, index) => const Divider(height: 1),
                                itemBuilder: (context, index) {
                                  final option = options.elementAt(index);
                                  return ListTile(
                                    title: Text(
                                      option['Com_Name'] ?? option['Sci_Name'],
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    subtitle: Text(
                                      option['Sci_Name'],
                                      style: TextStyle(fontSize: 11, color: AppColors.textHint),
                                    ),
                                    onTap: () => onSelected(option),
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  loading: () => const LinearProgressIndicator(),
                  error: (e, _) => const SizedBox.shrink(),
                ),
                
                const SizedBox(height: 16),
                if (_selectedSpeciesList.isNotEmpty)
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _selectedSpeciesList.map((s) {
                      return Chip(
                        label: Text(s['Com_Name'] ?? s['Sci_Name']),
                        onDeleted: () {
                          setState(() {
                            _selectedSpeciesList.removeWhere((item) => item['Sci_Name'] == s['Sci_Name']);
                          });
                        },
                        deleteIconColor: AppColors.error,
                        backgroundColor: AppColors.cardElevated,
                        side: BorderSide(color: AppColors.primaryLight.withOpacity(0.5)),
                      );
                    }).toList(),
                  )
                else
                  Text(
                    l10n.allSpeciesWillBeExported,
                    style: TextStyle(fontSize: 13, color: AppColors.textHint, fontStyle: FontStyle.italic),
                  ),

                const Spacer(),
                ElevatedButton(
                  onPressed: _downloadCsv,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.download, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        l10n.export.toUpperCase(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
