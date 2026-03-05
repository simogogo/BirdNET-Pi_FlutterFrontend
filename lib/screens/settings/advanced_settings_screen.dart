import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:birdnet_pi_app/l10n/app_localizations.dart';
import '../../config/theme.dart';
import '../../services/api_service.dart';
import '../../widgets/auth_guard.dart';
import '../../widgets/auth_lock_icon.dart';

class AdvancedSettingsScreen extends ConsumerStatefulWidget {
  const AdvancedSettingsScreen({super.key});

  @override
  ConsumerState<AdvancedSettingsScreen> createState() =>
      _AdvancedSettingsScreenState();
}

class _AdvancedSettingsScreenState
    extends ConsumerState<AdvancedSettingsScreen> {
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
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              success
                  ? AppLocalizations.of(
                      context,
                    )!.advancedSettingsSavedSuccessfully
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
        title: Text(AppLocalizations.of(context)!.advancedSettings),
        actions: const [AuthLockIcon()],
      ),
      body: AuthGuard(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildSectionHeader(
                AppLocalizations.of(context)!.privacyRecordings,
              ),
              _buildTextField(
                AppLocalizations.of(context)!.privacyThreshold,
                'PRIVACY_THRESHOLD',
                isNumber: true,
              ),

              const SizedBox(height: 24),
              _buildSectionHeader(
                AppLocalizations.of(context)!.diskSpaceManagement,
              ),
              _buildDropdown(
                AppLocalizations.of(context)!.whenDiskIsFull,
                'FULL_DISK',
                ['keep', 'purge'],
              ),
              if (_config['FULL_DISK'] == 'purge')
                _buildTextField(
                  AppLocalizations.of(context)!.purgeCapacity,
                  'PURGE_THRESHOLD',
                  isNumber: true,
                ),
              _buildTextField(
                AppLocalizations.of(context)!.maxFilesToKeepPerSpecies,
                'MAX_FILES_SPECIES',
                isNumber: true,
              ),

              const SizedBox(height: 24),
              _buildSectionHeader(AppLocalizations.of(context)!.audioSettings),
              _buildTextField(
                AppLocalizations.of(context)!.alsaInputCaptureDevice,
                'REC_CARD',
              ),
              _buildDropdown(
                AppLocalizations.of(context)!.numberOfAudioChannels,
                'CHANNELS',
                ['1', '2'],
              ),
              _buildTextField(
                AppLocalizations.of(context)!.overlap,
                'OVERLAP',
                isNumber: true,
              ),
              _buildDropdown(
                AppLocalizations.of(context)!.audioFormat,
                'AUDIOFMT',
                ['mp3', 'wav', 'flac'],
              ),
              _buildTextField(
                AppLocalizations.of(context)!.recordingLength,
                'RECORDING_LENGTH',
                isNumber: true,
              ),
              _buildTextField(
                AppLocalizations.of(context)!.extractionLength,
                'EXTRACTION_LENGTH',
                isNumber: true,
              ),

              const SizedBox(height: 24),
              _buildSectionHeader(
                AppLocalizations.of(context)!.rtspAudioSharing,
              ),
              _buildSwitch(
                AppLocalizations.of(context)!.shareLiveAudioStream,
                'RTSP_STREAM',
                '1',
                '0',
              ),
              _buildSwitch(
                AppLocalizations.of(context)!.playAudioStreamThroughWebUi,
                'RTSP_STREAM_TO_LIVESTREAM',
                '1',
                '0',
              ),

              const SizedBox(height: 24),
              _buildSectionHeader(AppLocalizations.of(context)!.caddyPassword),
              _buildTextField(
                AppLocalizations.of(context)!.appPassword,
                'CADDY_PWD',
                isPassword: true,
              ),

              const SizedBox(height: 24),
              _buildSectionHeader(
                AppLocalizations.of(context)!.customLogoImage,
              ),
              _buildTextField(
                AppLocalizations.of(context)!.customImageUrl,
                'CUSTOM_IMAGE',
              ),
              _buildTextField(
                AppLocalizations.of(context)!.customImageTitle,
                'CUSTOM_IMAGE_TITLE',
              ),

              const SizedBox(height: 24),
              _buildSectionHeader(
                AppLocalizations.of(context)!.birdNetLiteModelSettings,
              ),
              _buildTextField(
                AppLocalizations.of(context)!.confidenceThreshold,
                'CONFIDENCE',
                isNumber: true,
              ),
              _buildTextField(
                AppLocalizations.of(context)!.sensitivity,
                'SENSITIVITY',
                isNumber: true,
              ),

              const SizedBox(height: 24),
              _buildSectionHeader(AppLocalizations.of(context)!.otherSettings),
              _buildSwitch(
                AppLocalizations.of(context)!.silenceUpdateIndicator,
                'SILENCE_UPDATE_INDICATOR',
                '1',
                '0',
              ),
              _buildSwitch(
                AppLocalizations.of(context)!.automaticUpdate,
                'AUTOMATIC_UPDATE',
                '1',
                '0',
              ),
              _buildSwitch(
                AppLocalizations.of(context)!.saveRawSpectrograms,
                'RAW_SPECTROGRAM',
                '1',
                '0',
              ),

              const SizedBox(height: 24),
              _buildSectionHeader(AppLocalizations.of(context)!.loggingLevels),
              _buildDropdown(
                AppLocalizations.of(context)!.birdnetRecordingService,
                'LogLevel_BirdnetRecordingService',
                ['error', 'warn', 'info', 'debug'],
              ),
              _buildDropdown(
                AppLocalizations.of(context)!.spectrogramViewerService,
                'LogLevel_SpectrogramViewerService',
                ['error', 'warn', 'info', 'debug'],
              ),
              _buildDropdown(
                AppLocalizations.of(context)!.liveAudioStreamService,
                'LogLevel_LiveAudioStreamService',
                ['error', 'warn', 'info', 'debug'],
              ),

              const SizedBox(height: 60),
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
    bool isPassword = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        initialValue: _config[key]?.toString() ?? '',
        obscureText: isPassword,
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
