import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_structure/core/core.dart';

void main() {
  group('FlavorConstants', () {
    test('should have the correct base URL', () {
      expect(FlavorConstants.baseUrl, 'baseUrl');
    });
  });
}
