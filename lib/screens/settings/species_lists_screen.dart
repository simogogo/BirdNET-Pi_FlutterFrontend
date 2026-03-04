import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:birdnet_pi_app/l10n/app_localizations.dart';
import '../../config/theme.dart';
import '../../services/api_service.dart';
import '../../widgets/app_shell.dart';
import '../../widgets/auth_guard.dart';
import '../../widgets/auth_lock_icon.dart';

// Provider per leggere il file labels dal bundle
final allSpeciesLabelsProvider = FutureProvider<List<String>>((ref) async {
  try {
    final String content = await rootBundle.loadString('assets/labels.txt');
    const LineSplitter ls = LineSplitter();
    final List<String> lines = ls.convert(content);
    return lines.where((line) => line.trim().isNotEmpty).toList();
  } catch (e) {
    debugPrint('Errore durante la lettura di labels.txt: $e');
    return [];
  }
});

final speciesListProvider = FutureProvider.family<List<String>, String>((
  ref,
  type,
) async {
  return ref.read(apiServiceProvider).getSpeciesListByType(type);
});

class SpeciesListsScreen extends ConsumerStatefulWidget {
  final String initialType;
  const SpeciesListsScreen({super.key, required this.initialType});

  @override
  ConsumerState<SpeciesListsScreen> createState() => _SpeciesListsScreenState();
}

class _SpeciesListsScreenState extends ConsumerState<SpeciesListsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _types = ['included', 'excluded', 'whitelist'];

  @override
  void initState() {
    super.initState();
    int initialIndex = _types.indexOf(widget.initialType);
    if (initialIndex == -1) initialIndex = 0;
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: initialIndex,
    );
  }

  @override
  void didUpdateWidget(covariant SpeciesListsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialType != widget.initialType) {
      int newIndex = _types.indexOf(widget.initialType);
      if (newIndex != -1 && newIndex != _tabController.index) {
        _tabController.animateTo(newIndex);
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.speciesListsManagement),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => AppShell.openDrawer(),
        ),
        actions: const [AuthLockIcon()],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.primaryLight,
          labelColor: AppColors.primaryLight,
          unselectedLabelColor: AppColors.textHint,
          tabs: [
            Tab(
              text: AppLocalizations.of(context)!.inclusion,
              icon: const Icon(Icons.checklist),
            ),
            Tab(
              text: AppLocalizations.of(context)!.exclusion,
              icon: const Icon(Icons.block),
            ),
            Tab(
              text: AppLocalizations.of(context)!.whitelist,
              icon: const Icon(Icons.star_outline),
            ),
          ],
        ),
      ),
      body: AuthGuard(
        child: TabBarView(
          controller: _tabController,
          children: const [
            _SpeciesListView(type: 'included'),
            _SpeciesListView(type: 'excluded'),
            _SpeciesListView(type: 'whitelist'),
          ],
        ),
      ),
    );
  }
}

class _SpeciesListView extends ConsumerStatefulWidget {
  final String type;
  const _SpeciesListView({required this.type});

  @override
  ConsumerState<_SpeciesListView> createState() => _SpeciesListViewState();
}

class _SpeciesListViewState extends ConsumerState<_SpeciesListView> {
  TextEditingController? _autoCompleteController;
  List<String> _localSpecies = [];
  bool _isInitialized = false;
  bool _isDirty = false;
  bool _isSaving = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      _isInitialized = false;
      _error = null;
    });
    try {
      final species = await ref
          .read(apiServiceProvider)
          .getSpeciesListByType(widget.type);
      if (mounted) {
        setState(() {
          _localSpecies = List.from(species);
          _isInitialized = true;
          _isDirty = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isInitialized = true;
        });
      }
    }
  }

  void _addSpecies() {
    final name = _autoCompleteController?.text.trim() ?? '';
    if (name.isEmpty) return;

    if (!_localSpecies.contains(name)) {
      setState(() {
        _localSpecies.add(name);
        _isDirty = true;
      });
      _autoCompleteController?.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.speciesAlreadyInList),
        ),
      );
    }
  }

  void _removeSpecies(String name) {
    setState(() {
      _localSpecies.remove(name);
      _isDirty = true;
    });
  }

  Future<void> _saveChanges() async {
    setState(() {
      _isSaving = true;
    });

    final api = ref.read(apiServiceProvider);
    final success = await api.updateSpeciesList(widget.type, _localSpecies);

    if (mounted) {
      setState(() {
        _isSaving = false;
      });

      if (success) {
        setState(() {
          _isDirty = false;
        });
        ref.invalidate(speciesListProvider(widget.type));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.listSavedSuccessfully),
            backgroundColor: AppColors.success,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.errorSavingList),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  String _formatSpeciesName(String rawName) {
    if (rawName.contains('_')) {
      final parts = rawName.split('_');
      if (parts.length >= 2) {
        final latin = parts[0];
        final common = parts.sublist(1).join('_');
        return '$common ($latin)';
      }
    }
    return rawName;
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.primaryLight),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppLocalizations.of(context)!.errorLoadingList(_error ?? ''),
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.error),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadData,
              child: Text(AppLocalizations.of(context)!.retry),
            ),
          ],
        ),
      );
    }

    final labelsAsync = ref.watch(allSpeciesLabelsProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: labelsAsync.when(
                  data: (labels) {
                    return Autocomplete<String>(
                      displayStringForOption: _formatSpeciesName,
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text.isEmpty) {
                          return const Iterable<String>.empty();
                        }
                        final lowerQuery = textEditingValue.text.toLowerCase();
                        return labels.where((String option) {
                          return option.toLowerCase().contains(lowerQuery) ||
                              _formatSpeciesName(
                                option,
                              ).toLowerCase().contains(lowerQuery);
                        });
                      },
                      onSelected: (String selection) {
                        _autoCompleteController?.text = selection;
                      },
                      fieldViewBuilder:
                          (
                            BuildContext context,
                            TextEditingController textEditingController,
                            FocusNode focusNode,
                            VoidCallback onFieldSubmitted,
                          ) {
                            _autoCompleteController = textEditingController;
                            return TextField(
                              controller: textEditingController,
                              focusNode: focusNode,
                              decoration: InputDecoration(
                                hintText: AppLocalizations.of(
                                  context,
                                )!.searchSpeciesHint,
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: AppColors.textHint,
                                ),
                                filled: true,
                                fillColor: AppColors.surface,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              onSubmitted: (String value) {
                                onFieldSubmitted();
                                _addSpecies();
                              },
                            );
                          },
                      optionsViewBuilder:
                          (
                            BuildContext context,
                            AutocompleteOnSelected<String> onSelected,
                            Iterable<String> options,
                          ) {
                            return Align(
                              alignment: Alignment.topLeft,
                              child: Material(
                                elevation: 4.0,
                                borderRadius: BorderRadius.circular(12),
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxHeight: 200,
                                    maxWidth:
                                        MediaQuery.of(context).size.width - 80,
                                  ),
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    itemCount: options.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                          final String option = options
                                              .elementAt(index);
                                          return InkWell(
                                            onTap: () {
                                              onSelected(option);
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                16.0,
                                              ),
                                              child: Text(option),
                                            ),
                                          );
                                        },
                                  ),
                                ),
                              ),
                            );
                          },
                    );
                  },
                  loading: () => TextField(
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.loadingSpecies,
                      filled: true,
                      prefixIcon: const CircularProgressIndicator(),
                    ),
                    enabled: false,
                  ),
                  error: (e, st) => TextField(
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(
                        context,
                      )!.errorLoadingSpecies,
                      filled: true,
                    ),
                    enabled: false,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: _addSpecies,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.add, color: AppColors.primaryLight),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: _localSpecies.isEmpty
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.list_alt,
                        size: 64,
                        color: AppColors.textHint.withValues(alpha: 0.5),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        AppLocalizations.of(context)!.noSpeciesInThisList,
                        style: const TextStyle(color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.only(bottom: 24),
                  itemCount: _localSpecies.length,
                  itemBuilder: (context, index) {
                    final name = _localSpecies[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      color: AppColors.surface,
                      child: ListTile(
                        title: Text(
                          _formatSpeciesName(name),
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete_outline,
                            color: AppColors.error,
                          ),
                          onPressed: () => _removeSpecies(name),
                          tooltip: AppLocalizations.of(context)!.removeFromList,
                        ),
                      ),
                    );
                  },
                ),
        ),
        if (_isDirty)
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: AppColors.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  offset: const Offset(0, -2),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _isSaving ? null : _saveChanges,
                    icon: _isSaving
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Icon(Icons.save),
                    label: Text(
                      _isSaving
                          ? AppLocalizations.of(context)!.saving
                          : AppLocalizations.of(context)!.save,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryLight,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
