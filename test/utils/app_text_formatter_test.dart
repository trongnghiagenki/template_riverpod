// FILEPATH: /Users/nghia/project/riverpod_structure/test/utils/app_text_formatter_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_structure/core/utils/app_text_formatter.dart';

void main() {
  group('CommaTextInputFormatter', () {
    final formatter = CommaTextInputFormatter();

    test('should replace comma with period', () {
      const oldValue = TextEditingValue(text: '1,23');
      const newValue = TextEditingValue(text: '1,23');

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, '1.23');
    });

    test('should not modify input without comma', () {
      const oldValue = TextEditingValue(text: '123');
      const newValue = TextEditingValue(text: '123');

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, '123');
    });

    test('should handle empty string', () {
      const oldValue = TextEditingValue(text: '');
      const newValue = TextEditingValue(text: '');

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, '');
    });
  });
}
