import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:birdnet_pi_app/l10n/app_localizations.dart';
import '../../config/theme.dart';
import '../../models/detection.dart';
import '../../services/api_service.dart';
import '../../utils/ebird_csv_generator.dart';
import '../../utils/web_downloader.dart';
import '../../widgets/auth_lock_icon.dart';

class WizardDetection {
  final Detection detection;
  bool included;
  String? count; // null corresponds to 'X'

  WizardDetection({required this.detection, this.included = true, this.count});
}

class EBirdWizardScreen extends ConsumerStatefulWidget {
  final String date;

  const EBirdWizardScreen({super.key, required this.date});

  @override
  ConsumerState<EBirdWizardScreen> createState() => _EBirdWizardScreenState();
}

class _EBirdWizardScreenState extends ConsumerState<EBirdWizardScreen> {
  int _currentStep = 0;
  bool _isLoading = true;

  // State for Step 1
  Map<String, List<WizardDetection>> _detectionsByHour = {};
  Map<String, String> _hourlyProtocols = {};
  bool _autoRemoveLowConfidence = false;

  // State for Step 2
  final _formKey = GlobalKey<FormState>();
  final _localityCtrl = TextEditingController();
  final _latCtrl = TextEditingController();
  final _lonCtrl = TextEditingController();
  final _stateProvCtrl = TextEditingController();
  final _countryCtrl = TextEditingController();
  final _obsCtrl = TextEditingController(text: '1');
  final _commentsCtrl = TextEditingController();
  bool _includeAudioLinks = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_commentsCtrl.text.isEmpty) {
      _commentsCtrl.text = AppLocalizations.of(
        context,
      )!.autoDetectionsViaBirdNet;
    }
  }

  @override
  void initState() {
    super.initState();
    _loadDetections();
    _loadConfig();
  }

  Future<void> _loadDetections() async {
    final api = ref.read(apiServiceProvider);
    try {
      final hoursMap = await api.getDetectionsByDate(widget.date);
      final newMap = <String, List<WizardDetection>>{};

      hoursMap.forEach((hour, list) {
        newMap[hour] = list.map((d) => WizardDetection(detection: d)).toList();
        _hourlyProtocols[hour] = 'Stationary';
      });

      setState(() {
        _detectionsByHour = newMap;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${AppLocalizations.of(context)!.errorLoading}: $e'),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _loadConfig() async {
    final prefs = await SharedPreferences.getInstance();
    _localityCtrl.text =
        prefs.getString('birdnet_locality') ?? 'BirdNET-Pi Station';
    _latCtrl.text = prefs.getString('birdnet_latitude') ?? '';
    _lonCtrl.text = prefs.getString('birdnet_longitude') ?? '';
    _stateProvCtrl.text = prefs.getString('birdnet_state_province') ?? '';
    _countryCtrl.text = prefs.getString('birdnet_country_code') ?? '';

    // If empty, try api
    if (_latCtrl.text.isEmpty) {
      final api = ref.read(apiServiceProvider);
      try {
        final loc = await api.getLocationConfig();
        if (mounted) {
          setState(() {
            _localityCtrl.text = loc['locality'] ?? _localityCtrl.text;
            _latCtrl.text = loc['latitude'] ?? '';
            _lonCtrl.text = loc['longitude'] ?? '';
            _stateProvCtrl.text = loc['stateProvince'] ?? '';
            _countryCtrl.text = loc['countryCode'] ?? '';
          });
        }
      } catch (_) {}
    }
  }

  Future<void> _saveConfig() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('birdnet_locality', _localityCtrl.text);
    await prefs.setString('birdnet_latitude', _latCtrl.text);
    await prefs.setString('birdnet_longitude', _lonCtrl.text);
    await prefs.setString('birdnet_state_province', _stateProvCtrl.text);
    await prefs.setString('birdnet_country_code', _countryCtrl.text);
  }

  void _applyAutoRemove(bool remove) {
    setState(() {
      _autoRemoveLowConfidence = remove;
      for (final list in _detectionsByHour.values) {
        for (final item in list) {
          if (item.detection.confidence < 0.8) {
            item.included = !remove;
          }
        }
      }
    });
  }

  List<WizardDetection> _getIncludedDetections() {
    final all = <WizardDetection>[];
    for (final list in _detectionsByHour.values) {
      all.addAll(list.where((i) => i.included));
    }
    return all;
  }

  Future<void> _generateAndDownloadCSV() async {
    final included = _getIncludedDetections();
    final dList = included.map((i) => i.detection).toList();
    final countsMap = {for (var i in included) i.detection: i.count ?? 'X'};

    final locationData = {
      'locality': _localityCtrl.text,
      'latitude': _latCtrl.text,
      'longitude': _lonCtrl.text,
      'stateProvince': _stateProvCtrl.text,
      'countryCode': _countryCtrl.text,
    };

    final csvString = EBirdCsvGenerator.generateCsv(
      detections: dList,
      detectionCounts: countsMap,
      dateStr: widget.date,
      hourlyProtocols: _hourlyProtocols,
      locationData: locationData,
      observersCount: int.tryParse(_obsCtrl.text) ?? 1,
      comments: _commentsCtrl.text,
      includeAudioLinks: _includeAudioLinks,
    );

    final String fileName = 'eBird_BirdNET_${widget.date}.csv';
    final success = await WebDownloader.downloadStringAsFile(
      content: csvString,
      filename: fileName,
    );

    if (mounted) {
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context)!.downloadStartedSuccessfully,
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.cannotDownloadCsv),
          ),
        );
      }
    }
  }

  Future<void> _generateAndDownloadZIP() async {
    final included = _getIncludedDetections();

    // Mostriamo un caricamento visivo
    setState(() => _isLoading = true);

    try {
      final filesToZip = included.map((i) {
        final comName = i.detection.commonName
            .replaceAll(' ', '_')
            .replaceAll("'", '');
        return {'filename': i.detection.fileName, 'species': comName};
      }).toList();

      final apiService = ref.read(apiServiceProvider);
      final downloadUrl = await apiService.createExportZip(
        widget.date,
        filesToZip,
      );

      if (mounted) {
        setState(() => _isLoading = false);
        if (downloadUrl != null) {
          final Uri uri = Uri.parse(downloadUrl);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    AppLocalizations.of(context)!.zipDownloadInProgress,
                  ),
                ),
              );
            }
          } else {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(AppLocalizations.of(context)!.cannotOpenZipUrl),
                ),
              );
            }
          }
        } else {
          throw Exception(
            AppLocalizations.of(context)!.serverDidNotReturnDownloadUrl,
          );
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        String errorMsg = '${AppLocalizations.of(context)!.unknownError}: $e';
        if (e is DioException && e.response?.data != null) {
          final data = e.response?.data;
          if (data is Map && data['error'] != null) {
            errorMsg = data['error'].toString();
          } else {
            errorMsg = e.message ?? e.toString();
          }
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${AppLocalizations.of(context)!.serverError}: $errorMsg',
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: AppColors.primaryLight),
        ),
      );
    }

    final includedList = _getIncludedDetections();
    final uniqueSpecies = includedList
        .map((i) => i.detection.scientificName)
        .toSet();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${AppLocalizations.of(context)!.ebirdExport} - ${widget.date}',
        ),
        actions: const [AuthLockIcon()],
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep == 1 && !_formKey.currentState!.validate()) {
            return;
          }
          if (_currentStep == 1) {
            _saveConfig();
          }
          if (_currentStep < 2) {
            setState(() => _currentStep += 1);
          } else {
            _generateAndDownloadCSV();
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() => _currentStep -= 1);
          } else {
            Navigator.pop(context);
          }
        },
        controlsBuilder: (context, details) {
          final isLast = _currentStep == 2;

          if (isLast) {
            return Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton.icon(
                    onPressed: _generateAndDownloadCSV,
                    icon: const Icon(Icons.table_chart),
                    label: Text(
                      AppLocalizations.of(context)!.generateCsvForEbird,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryLight,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: _generateAndDownloadZIP,
                    icon: const Icon(Icons.folder_zip),
                    label: Text(AppLocalizations.of(context)!.downloadAudioZip),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                    label: Text(AppLocalizations.of(context)!.close),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ],
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: details.onStepContinue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryLight,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(AppLocalizations.of(context)!.continueStep),
                ),
                const SizedBox(width: 12),
                TextButton(
                  onPressed: details.onStepCancel,
                  child: Text(
                    _currentStep == 0
                        ? AppLocalizations.of(context)!.cancel
                        : AppLocalizations.of(context)!.back,
                  ),
                ),
              ],
            ),
          );
        },
        steps: [
          Step(
            title: Text(AppLocalizations.of(context)!.review),
            isActive: _currentStep >= 0,
            content: _buildStep1(uniqueSpecies.length, includedList.length),
          ),
          Step(
            title: Text(AppLocalizations.of(context)!.configuration),
            isActive: _currentStep >= 1,
            content: _buildStep2(),
          ),
          Step(
            title: Text(AppLocalizations.of(context)!.summary),
            isActive: _currentStep >= 2,
            content: _buildStep3(uniqueSpecies.length, includedList),
          ),
        ],
      ),
    );
  }

  Widget _buildStep1(int totalSpecies, int totalDetects) {
    final sortedHours = _detectionsByHour.keys.toList()..sort();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SwitchListTile(
          title: Text(AppLocalizations.of(context)!.autoRemoveLessThan80),
          value: _autoRemoveLowConfidence,
          onChanged: _applyAutoRemove,
          activeColor: AppColors.primaryLight,
        ),
        Text(
          AppLocalizations.of(context)!.speciesRead(totalSpecies, totalDetects),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ...sortedHours.map((hour) {
          final list = _detectionsByHour[hour]!;
          if (list.isEmpty) return const SizedBox();

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            color: AppColors.cardElevated,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Theme(
              data: Theme.of(
                context,
              ).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                iconColor: AppColors.success,
                collapsedIconColor: AppColors.success,
                title: Text(
                  '$hour:00 - $hour:59 (${AppLocalizations.of(context)!.detectionsCountStr(list.length)})',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3,
                  ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                    child: DropdownButtonFormField<String>(
                      value: _hourlyProtocols[hour],
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.protocol,
                        filled: true,
                        fillColor: AppColors.card,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                      items: [
                        DropdownMenuItem(
                          value: 'Stationary',
                          child: Text(
                            AppLocalizations.of(context)!.stationaryPoint,
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'P54',
                          child: Text(
                            AppLocalizations.of(context)!.nocturnalFlightCall,
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Incidental',
                          child: Text(AppLocalizations.of(context)!.incidental),
                        ),
                      ],
                      onChanged: (val) {
                        if (val != null) {
                          setState(() => _hourlyProtocols[hour] = val);
                        }
                      },
                    ),
                  ),
                  ...list.map((item) {
                    return Container(
                      margin: const EdgeInsets.only(
                        left: 16,
                        right: 8, // slight margin for checkbox alignment
                        bottom: 16,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            decoration: BoxDecoration(
                              color: AppColors.card,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextFormField(
                              initialValue:
                                  item.count ??
                                  AppLocalizations.of(
                                    context,
                                  )!.ebirdCountDefault,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              decoration: InputDecoration(
                                labelText: AppLocalizations.of(
                                  context,
                                )!.ebirdCountIdentifier,
                                labelStyle: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 8,
                                ),
                                isDense: true,
                              ),
                              onChanged: (val) {
                                final def = AppLocalizations.of(
                                  context,
                                )!.ebirdCountDefault;
                                item.count = val.isEmpty ? def : val;
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.detection.commonName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text(
                                      '${(item.detection.confidence * 100).toStringAsFixed(0)}%',
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors
                                            .accent, // A distinct color for confidence
                                      ),
                                    ),
                                    const Text(
                                      ' | ',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: AppColors.textHint,
                                      ),
                                    ),
                                    Text(
                                      item.detection.time,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: AppColors
                                            .textSecondary, // A different color for time
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Transform.scale(
                            scale: 1.1,
                            child: Checkbox(
                              value: item.included,
                              activeColor: AppColors.success,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              onChanged: (val) =>
                                  setState(() => item.included = val ?? true),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildStep2() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            TextFormField(
              controller: _localityCtrl,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.localityName,
                border: const OutlineInputBorder(),
              ),
              validator: (v) => v!.isEmpty
                  ? AppLocalizations.of(context)!.requiredField
                  : null,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _latCtrl,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.latitude,
                      border: const OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (v) => v!.isEmpty ? '*' : null,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: _lonCtrl,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.longitude,
                      border: const OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (v) => v!.isEmpty ? '*' : null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 16,
              children: [
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    controller: _stateProvCtrl,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.stateProvince,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (v) => v!.isEmpty ? '*' : null,
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: TextFormField(
                    controller: _countryCtrl,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.countryCode,
                      border: const OutlineInputBorder(),
                    ),
                    maxLength: 2,
                    validator: (v) => v!.isEmpty ? '*' : null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _obsCtrl,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.numberOfObservers,
                border: const OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _commentsCtrl,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.additionalComments,
                border: const OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 12),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                AppLocalizations.of(context)!.includeAudioFileNamesInComments,
              ),
              value: _includeAudioLinks,
              activeColor: AppColors.primaryLight,
              onChanged: (v) => setState(() => _includeAudioLinks = v),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep3(int totalSpecies, List<WizardDetection> includedList) {
    double confidenceSum = 0;
    for (var i in includedList) {
      confidenceSum += i.detection.confidence;
    }
    double avgConf = includedList.isEmpty
        ? 0
        : (confidenceSum / includedList.length) * 100;

    final hours = includedList
        .map((i) => i.detection.time.substring(0, 2))
        .toSet();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.readyForExport,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 0,
            color: AppColors.cardElevated,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: AppColors.primaryLight.withValues(alpha: 0.2),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.accent.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.pets, color: AppColors.accent),
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.totalUniqueSpecies,
                    ),
                    trailing: Text(
                      '$totalSpecies',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.accent,
                      ),
                    ),
                  ),
                  const Divider(indent: 70, endIndent: 16),
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.timer,
                        color: AppColors.primaryLight,
                      ),
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.hourlyModeledChecklists,
                    ),
                    trailing: Text(
                      '${hours.length}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryLight,
                      ),
                    ),
                  ),
                  const Divider(indent: 70, endIndent: 16),
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.orange.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.analytics, color: Colors.orange),
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.averageConfidence,
                    ),
                    trailing: Text(
                      '${avgConf.toStringAsFixed(1)}%',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primaryLight.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.info_outline, color: AppColors.primaryLight),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    AppLocalizations.of(context)!.wizardInfoText,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
