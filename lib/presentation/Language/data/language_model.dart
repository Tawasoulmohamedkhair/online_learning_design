import 'dart:ui';

class LanguageModel {
  String languageName;
  String subLanguage;
  String languageCode;

  Locale locale;

  LanguageModel({
    required this.languageName,
    required this.subLanguage,
    required this.languageCode,
    required this.locale,
  });
}

final List<LanguageModel> languagesModel = [
  LanguageModel(
    languageName: 'English',
    subLanguage: 'English',
    languageCode: 'en',
    locale: const Locale('en'),
  ),
  LanguageModel(
    languageName: 'العربية',
    subLanguage: 'العربية',
    languageCode: 'ar',
    locale: const Locale('ar'),
  ),
];
