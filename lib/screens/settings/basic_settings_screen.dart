import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../l10n/app_localizations.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../config/theme.dart';
import '../../config/api_config.dart';
import '../../providers/theme_provider.dart';
import '../../services/api_service.dart';
import '../../widgets/auth_guard.dart';
import '../../widgets/auth_lock_icon.dart';

import '../../providers/database_lang_provider.dart';

class BasicSettingsScreen extends ConsumerStatefulWidget {
  const BasicSettingsScreen({super.key});

  @override
  ConsumerState<BasicSettingsScreen> createState() =>
      _BasicSettingsScreenState();
}

class _BasicSettingsScreenState extends ConsumerState<BasicSettingsScreen> {
  bool _isLoading = true;
  bool _isSaving = false;
  Map<String, dynamic> _config = {};

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loadConfig();
  }

  Future<void> _loadConfig() async {
    setState(() => _isLoading = true);
    try {
      final config = await ref.read(apiServiceProvider).getConfig();
      setState(() {
        _config = config;
        _isLoading = false;
      });
    } catch (e) {
      if (mounted) {
        // Ignoriamo l'errore (inclusi i 401) perché il widget AuthGuard
        // mostrerà la schermata di login se non si è autenticati.
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _saveConfig() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    setState(() => _isSaving = true);
    try {
      final success = await ref.read(apiServiceProvider).updateConfig(_config);
      if (success) {
        // Invalidiamo il provider della lingua database in modo che eventuali altri screen si aggiornino
        ref.invalidate(databaseLangProvider);
        // Ricarichiamo la configurazione per riflettere eventuali normalizzazioni del server (es. SF_THRESH)
        _loadConfig();
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              success
                  ? AppLocalizations.of(context)!.basicSettingsSavedSuccessfully
                  : AppLocalizations.of(context)!.errorWhileSaving,
            ),
            backgroundColor: success ? AppColors.success : AppColors.error,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context)!.exceptionDuringSave(e.toString()),
            ),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.basicSettings),
        actions: const [AuthLockIcon()],
      ),
      body: AuthGuard(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildSectionHeader(AppLocalizations.of(context)!.model),
              _buildDropdown(
                AppLocalizations.of(context)!.selectAModel,
                'MODEL',
                [
                  'BirdNET_GLOBAL_6K_V2.4_Model_FP16',
                  'BirdNET_6K_GLOBAL_MODEL',
                ],
              ),
              if (_config['MODEL'] == 'BirdNET_GLOBAL_6K_V2.4_Model_FP16') ...[
                _buildSwitch(
                  AppLocalizations.of(context)!.speciesRangeModel,
                  'DATA_MODEL_VERSION',
                  '2',
                  '1',
                ),
                _buildTextField(
                  AppLocalizations.of(
                    context,
                  )!.speciesOccurrenceFrequencyThreshold,
                  'SF_THRESH',
                  isNumber: true,
                  helpText:
                      AppLocalizations.of(context)!.sfThreshHelpExtended +
                      '\n\n' +
                      (_config['MODEL'] == 'BirdNET_6K_GLOBAL_MODEL'
                          ? AppLocalizations.of(context)!
                              .sfThreshTesterLegacyHint
                          : AppLocalizations.of(context)!.sfThreshTesterHint),
                  validator: (value) {
                    if (value == null || value.isEmpty) return null;
                    final n = double.tryParse(value.replaceFirst(',', '.'));
                    if (n == null || n < 0.0005 || n > 0.99) {
                      return AppLocalizations.of(context)!
                          .invalidValueRange(0.0005, 0.99);
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: () => _showSpeciesTesterDialog(),
                  icon: const Icon(Icons.science_outlined),
                  label: Text(AppLocalizations.of(context)!.speciesListTester),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 24),
              _buildSectionHeader(AppLocalizations.of(context)!.location),
              _buildTextField(
                AppLocalizations.of(context)!.siteName,
                'SITE_NAME',
              ),
              _buildTextField(
                AppLocalizations.of(context)!.latitudeInput,
                'LATITUDE',
                isNumber: true,
              ),
              _buildTextField(
                AppLocalizations.of(context)!.longitudeInput,
                'LONGITUDE',
                isNumber: true,
              ),
              const SizedBox(height: 24),
              _buildSectionHeader('BirdWeather'),
              _buildTextField(
                AppLocalizations.of(context)!.birdWeatherToken,
                'BIRDWEATHER_ID',
                helpText: AppLocalizations.of(context)!.birdWeatherHelp,
              ),
              const SizedBox(height: 24),
              _buildSectionHeader(
                AppLocalizations.of(context)!.notificationsApprise,
              ),
              _buildTextField(
                AppLocalizations.of(context)!.appriseConfig,
                'APPRISE',
                maxLines: 5,
                helpText: AppLocalizations.of(context)!.appriseConfigHelp,
              ),
              _buildTextField(
                AppLocalizations.of(context)!.notificationTitle,
                'APPRISE_NOTIFICATION_TITLE',
                helpText: AppLocalizations.of(context)!.notificationVarsHelp,
              ),
              _buildTextField(
                AppLocalizations.of(context)!.notificationBody,
                'APPRISE_NOTIFICATION_BODY',
                maxLines: 5,
                helpText: AppLocalizations.of(context)!.notificationVarsHelp,
              ),
              _buildSwitch(
                AppLocalizations.of(context)!.notifyNewInfrequent,
                'APPRISE_NOTIFY_NEW_SPECIES',
                '1',
                '0',
              ),
              _buildSwitch(
                AppLocalizations.of(context)!.notifyFirstDetectionOfDay,
                'APPRISE_NOTIFY_NEW_SPECIES_EACH_DAY',
                '1',
                '0',
              ),
              _buildSwitch(
                AppLocalizations.of(context)!.notifyEachNewDetection,
                'APPRISE_NOTIFY_EACH_DETECTION',
                '1',
                '0',
              ),
              _buildSwitch(
                AppLocalizations.of(context)!.sendWeeklyReport,
                'APPRISE_WEEKLY_REPORT',
                '1',
                '0',
              ),
              _buildTextField(
                AppLocalizations.of(context)!.minTimeBetweenNotifications,
                'APPRISE_MINIMUM_SECONDS_BETWEEN_NOTIFICATIONS_PER_SPECIES',
                isNumber: true,
              ),
              _buildTextField(
                AppLocalizations.of(context)!.excludeTheseSpecies,
                'APPRISE_ONLY_NOTIFY_SPECIES_NAMES',
                helpText: AppLocalizations.of(context)!.excludeSpeciesHelp,
              ),
              _buildTextField(
                AppLocalizations.of(context)!.onlyNotifyForTheseSpecies,
                'APPRISE_ONLY_NOTIFY_SPECIES_NAMES_2',
                helpText: AppLocalizations.of(context)!.includeSpeciesHelp,
              ),
              const SizedBox(height: 24),
              _buildSectionHeader(AppLocalizations.of(context)!.imageSource),
              _buildDropdown(
                AppLocalizations.of(context)!.imageProvider,
                'IMAGE_PROVIDER',
                ['', 'WIKIPEDIA', 'FLICKR'],
              ),
              _buildTextField(
                AppLocalizations.of(context)!.flickrApiKey,
                'FLICKR_API_KEY',
                helpText: AppLocalizations.of(context)!.flickrHelp,
              ),
              _buildTextField(
                AppLocalizations.of(context)!.flickrFilterEmail,
                'FLICKR_FILTER_EMAIL',
              ),
              const SizedBox(height: 24),
              _buildSectionHeader(AppLocalizations.of(context)!.localization),
              _buildDropdown(
                AppLocalizations.of(context)!.databaseLanguage,
                'DATABASE_LANG',
                [
                  'af',
                  'ca',
                  'cs',
                  'da',
                  'de',
                  'en',
                  'es',
                  'et',
                  'fi',
                  'fr',
                  'hr',
                  'hu',
                  'id',
                  'is',
                  'it',
                  'ja',
                  'lt',
                  'lv',
                  'nl',
                  'no',
                  'pl',
                  'pt',
                  'ru',
                  'sk',
                  'sl',
                  'sv',
                  'th',
                  'uk',
                  'zh',
                ],
                helpText: AppLocalizations.of(context)!.databaseLangHelp,
              ),
              const SizedBox(height: 24),
              _buildSectionHeader(AppLocalizations.of(context)!.otherInfo),
              _buildDropdown(
                AppLocalizations.of(context)!.infoSite,
                'INFO_SITE',
                ['ALLABOUTBIRDS', 'EBIRD'],
                helpText: AppLocalizations.of(context)!.infoSiteHelp,
              ),
              const SizedBox(height: 24),
              _buildSectionHeader(AppLocalizations.of(context)!.themeWeb),
              _buildColorSchemeDropdown(),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: _isSaving ? null : _saveConfig,
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
                    AppLocalizations.of(context)!.save,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  /// Dropdown specializzato per COLOR_SCHEME: al cambio applica il tema
  /// immediatamente (Opzione A) tramite [themeModeProvider].
  Widget _buildColorSchemeDropdown() {
    const options = ['light', 'dark'];
    final current = options.contains(_config['COLOR_SCHEME']?.toString())
        ? _config['COLOR_SCHEME'].toString()
        : 'dark';

    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: DropdownButtonFormField<String>(
        initialValue: current,
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context)!.colorScheme,
          filled: true,
          fillColor: AppColors.card,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        items: options
            .map((v) => DropdownMenuItem(
                  value: v,
                  child: Text(v == 'light'
                      ? AppLocalizations.of(context)!.themeLight
                      : AppLocalizations.of(context)!.themeDark),
                ))
            .toList(),
        onChanged: (newValue) {
          if (newValue == null) return;
          setState(() => _config['COLOR_SCHEME'] = newValue);
          // Opzione A: applica il tema subito, senza attendere il salvataggio
          ref.read(themeModeProvider.notifier).setScheme(newValue);
        },
        onSaved: (value) {
          if (value != null) _config['COLOR_SCHEME'] = value;
        },
      ),
    );
  }

  void _showHelpDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.info_outline, color: AppColors.primary),
            const SizedBox(width: 8),
            Expanded(child: Text(title)),
          ],
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title ==
                    AppLocalizations.of(
                      context,
                    )!.speciesOccurrenceFrequencyThreshold) ...[
                  Image.network(
                    '${ApiConfig.baseUrl}/images/BirdNET-Pi_nm_flowchart.alpha.png',
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) =>
                        const SizedBox.shrink(),
                  ),
                  const SizedBox(height: 16),
                ],
                MarkdownBody(
                  data: content,
                  onTapLink: (text, href, title) {
                    if (href != null) {
                      launchUrl(Uri.parse(href),
                          mode: LaunchMode.externalApplication);
                    }
                  },
                  styleSheet: MarkdownStyleSheet(
                    p: const TextStyle(fontSize: 14),
                    a: TextStyle(color: AppColors.primaryLight),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)!.close),
          ),
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  void _showSpeciesTesterDialog() {
    final thresholdController = TextEditingController(
      text: _config['SF_THRESH']?.toString() ?? '0.03',
    );
    String output = '';
    bool isLoading = false;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            title: Text(AppLocalizations.of(context)!.speciesListTester),
            content: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: thresholdController,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.threshold,
                      filled: true,
                      fillColor: AppColors.card,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () async {
                              setDialogState(() => isLoading = true);
                              try {
                                final threshold = double.parse(
                                  thresholdController.text
                                      .replaceFirst(',', '.'),
                                );
                                final result = await ref
                                    .read(apiServiceProvider)
                                    .getSpeciesTesterPreview(threshold);
                                setDialogState(() {
                                  output = result;
                                  isLoading = false;
                                });
                              } catch (e) {
                                setDialogState(() {
                                  output = 'Error: $e';
                                  isLoading = false;
                                });
                              }
                            },
                      child: Text(
                        AppLocalizations.of(context)!.previewSpeciesList,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (isLoading)
                    const Center(child: CircularProgressIndicator())
                  else
                    Flexible(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SingleChildScrollView(
                          child: Text(
                            output,
                            style: const TextStyle(
                              fontFamily: 'monospace',
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(AppLocalizations.of(context)!.close),
              ),
            ],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title, {String? helpText}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryLight,
            ),
          ),
          if (helpText != null)
            IconButton(
              icon: const Icon(Icons.info_outline, size: 20),
              onPressed: () => _showHelpDialog(title, helpText),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              constraints: const BoxConstraints(),
            ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    String label,
    String key, {
    bool isNumber = false,
    int maxLines = 1,
    String? helpText,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        initialValue: _config[key]?.toString() ?? '',
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: AppColors.card,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          suffixIcon: helpText != null
              ? IconButton(
                  icon: const Icon(Icons.info_outline),
                  onPressed: () => _showHelpDialog(label, helpText),
                )
              : null,
        ),
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        maxLines: maxLines,
        onChanged: (value) {
          _config[key] = value.trim();
        },
        onSaved: (value) {
          if (value != null) {
            _config[key] = value.trim();
          }
        },
      ),
    );
  }

  Widget _buildDropdown(
    String label,
    String key,
    List<String> options, {
    String? helpText,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: DropdownButtonFormField<String>(
        initialValue: options.contains(_config[key]?.toString())
            ? _config[key]?.toString()
            : (options.isNotEmpty ? options.first : null),
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: AppColors.card,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          suffixIcon: helpText != null
              ? IconButton(
                  icon: const Icon(Icons.info_outline),
                  onPressed: () => _showHelpDialog(label, helpText),
                )
              : null,
        ),
        items: options.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value.isEmpty ? AppLocalizations.of(context)!.none : value,
            ),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            _config[key] = newValue;
          });
        },
        onSaved: (value) {
          if (value != null) {
            _config[key] = value;
          }
        },
      ),
    );
  }

  Widget _buildSwitch(
    String label,
    String key,
    String trueValue,
    String falseValue,
  ) {
    return SwitchListTile(
      title: Text(label),
      value: _config[key]?.toString() == trueValue,
      activeThumbColor: AppColors.primary,
      contentPadding: EdgeInsets.zero,
      onChanged: (bool value) {
        setState(() {
          _config[key] = value ? trueValue : falseValue;
        });
      },
    );
  }
}
