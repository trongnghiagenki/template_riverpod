import 'package:flutter/material.dart';

class LocaleConstants {
  LocaleConstants._();

  static const String path = 'assets/translations';
  static String getPath(Locale locale) => '$path/${locale.languageCode}.json';

  static const String currentLanguageCode = 'currentLanguageCode';
  static const String currentCountryCode = 'currentCountryCode';

  static const Locale ja = Locale('ja', 'JP');
  static const Locale en = Locale('en', 'US');
}
