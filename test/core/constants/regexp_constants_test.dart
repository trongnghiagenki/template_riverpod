import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_structure/core/core.dart';

void main() {
  group('RegExpConstants', () {
    test('should match a valid password', () {
      expect(RegExpConstants.password.hasMatch('Abc123456789'), isTrue);
    });

    test('should not match an invalid password', () {
      expect(RegExpConstants.password.hasMatch('abcdefghijkl'), isFalse);
      expect(RegExpConstants.password.hasMatch('abcd12345'), isFalse);
      expect(RegExpConstants.password.hasMatch('Abcdefghijkl'), isFalse);
      expect(RegExpConstants.password.hasMatch('123456789'), isFalse);
      expect(RegExpConstants.password.hasMatch('123456789101'), isFalse);
    });

    test('should match a valid email', () {
      expect(RegExpConstants.email.hasMatch('test@example.com'), isTrue);
    });

    test('should not match an invalid email', () {
      expect(RegExpConstants.email.hasMatch('test@example'), isFalse);
      expect(RegExpConstants.email.hasMatch('testexample.com'), isFalse);
      expect(RegExpConstants.email.hasMatch('test@.com'), isFalse);
    });
  });
}
