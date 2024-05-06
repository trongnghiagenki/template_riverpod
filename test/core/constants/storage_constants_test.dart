import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_structure/core/core.dart';

void main() {
  group('StorageConstants', () {
    test('should have correct secureKey value', () {
      expect(StorageConstants.secureKey, 'encKey');
    });

    test('should have correct storage value', () {
      expect(StorageConstants.storage, 'storage');
    });

    test('should have correct storageEnc value', () {
      expect(StorageConstants.storageEnc, 'storageEnc');
    });

    test('should have correct userInfo value', () {
      expect(StorageConstants.userInfo, 'userInfo');
    });
  });
}
