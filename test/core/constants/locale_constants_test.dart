import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_structure/core/core.dart';

void main() {
  group('LocaleConstants', () {
    test('should have the correct path', () {
      expect(LocaleConstants.path, 'assets/translations');
    });

    test('should return the correct path for a given locale', () {
      expect(LocaleConstants.getPath(const Locale('ja', 'JP')),
          'assets/translations/ja.json');
      expect(LocaleConstants.getPath(const Locale('en', 'US')),
          'assets/translations/en.json');
    });

    test('should have the correct current language code', () {
      expect(LocaleConstants.currentLanguageCode, 'currentLanguageCode');
    });

    test('should have the correct current country code', () {
      expect(LocaleConstants.currentCountryCode, 'currentCountryCode');
    });

    test('should have the correct Japanese locale', () {
      expect(LocaleConstants.ja.languageCode, 'ja');
      expect(LocaleConstants.ja.countryCode, 'JP');
    });

    test('should have the correct English locale', () {
      expect(LocaleConstants.en.languageCode, 'en');
      expect(LocaleConstants.en.countryCode, 'US');
    });
  });
}
