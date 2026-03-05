import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:birdnet_pi_app/l10n/app_localizations.dart';
import '../../config/theme.dart';
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
              ),
              const SizedBox(height: 24),
              _buildSectionHeader(
                AppLocalizations.of(context)!.notificationsApprise,
              ),
              _buildTextField(
                AppLocalizations.of(context)!.appriseConfig,
                'APPRISE_INPUT',
                maxLines: 5,
              ),
              _buildTextField(
                AppLocalizations.of(context)!.notificationTitle,
                'APPRISE_NOTIFICATION_TITLE',
              ),
              _buildTextField(
                AppLocalizations.of(context)!.notificationBody,
                'APPRISE_NOTIFICATION_BODY',
                maxLines: 5,
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
              ),
              _buildTextField(
                AppLocalizations.of(context)!.onlyNotifyForTheseSpecies,
                'APPRISE_ONLY_NOTIFY_SPECIES_NAMES_2',
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
              ),
              const SizedBox(height: 24),
              _buildSectionHeader(AppLocalizations.of(context)!.otherInfo),
              _buildDropdown(
                AppLocalizations.of(context)!.infoSite,
                'INFO_SITE',
                ['ALLABOUTBIRDS', 'EBIRD'],
              ),
              const SizedBox(height: 24),
              _buildSectionHeader(AppLocalizations.of(context)!.themeWeb),
              _buildDropdown(
                AppLocalizations.of(context)!.colorScheme,
                'COLOR_SCHEME',
                ['light', 'dark'],
              ),
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
                    style: const TextStyle(
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

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryLight,
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    String key, {
    bool isNumber = false,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        initialValue: _config[key]?.toString() ?? '',
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: AppColors.card,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        maxLines: maxLines,
        onSaved: (value) {
          if (value != null) {
            _config[key] = value.trim();
          }
        },
      ),
    );
  }

  Widget _buildDropdown(String label, String key, List<String> options) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
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
        ),
        items: options.map((String value) {
          // This requires BuildContext to resolve empty translation. Since `_buildDropdown` does not have `BuildContext` easily if it's outside `build`, let's see where it is.
          // `_buildDropdown` is a method inside `ConsumerState`, so it doesn't have `context` bound to the method, but we can access `context` via `this.context`.
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
