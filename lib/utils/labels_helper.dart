/// Returns the asset path for the labels file matching [languageCode].
/// Falls back to English if the locale is not available.
String labelsAssetPath(String languageCode) {
  const supportedLabelLocales = {
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
  };
  final code = supportedLabelLocales.contains(languageCode)
      ? languageCode
      : 'en';
  return 'assets/labels_$code.txt';
}
