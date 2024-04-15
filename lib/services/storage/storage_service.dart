import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/core.dart';

part 'storage_service.g.dart';

@Riverpod(keepAlive: true)
Future<StorageService> storageService(StorageServiceRef ref) async {
  return await StorageService.init();
}

class StorageService {
  StorageService(this._box);

  final Box _box;

  static _getIosOptions() => const IOSOptions(
        accessibility: KeychainAccessibility.unlocked,
      );

  static _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
        resetOnError: true,
      );

  static _getWebOptions() => const WebOptions(
        dbName: 'AppDB',
        publicKey: 'AppPublicKey',
      );

  /// Initialize StorageService
  static Future<StorageService> init() async {
    // ignore: unused_local_variable
    bool needMigration = false;
    // Initialize secure storage
    final secureStorage = FlutterSecureStorage(
      iOptions: _getIosOptions(),
      aOptions: _getAndroidOptions(),
      webOptions: _getWebOptions(),
    );

    // Get secure key
    String? secureKey =
        await secureStorage.read(key: StorageConstants.secureKey);

    // Generate secure key if not exists
    if (secureKey == null) {
      needMigration = true;
      final genSecureKey = Hive.generateSecureKey();
      await secureStorage.write(
        key: StorageConstants.secureKey,
        value: base64UrlEncode(genSecureKey),
      );
    }

    // Get key
    secureKey = await secureStorage.read(key: StorageConstants.secureKey);
    final key = base64Url.decode(secureKey!);

    // Initialize Hive
    await Hive.initFlutter();

    // Register Hive adapters
    _registerAdapters();

    // Open Hive box with encryption
    final box = await Hive.openBox(
      StorageConstants.storageEnc,
      encryptionCipher: HiveAesCipher(key),
    );

    // Do migration here if needed
    // if (needMigration && await Hive.boxExists(StorageConstants.storage)) {
    //   final oldBox = await Hive.openBox(StorageConstants.storage);
    //   final keys = oldBox.keys;
    //   for (var key in keys) {
    //     final value = oldBox.get(key);
    //     await box.put(key, value);
    //   }
    //   await oldBox.close();
    //   await Hive.deleteBoxFromDisk(StorageConstants.storage);
    // }

    return StorageService(box);
  }

  /// Write value to storage
  Future<void> writeValue(String key, dynamic value) async {
    await _box.put(key, value);
  }

  /// Read value from storage
  T readValue<T>(String key, T defaultValue) {
    return _box.get(key, defaultValue: defaultValue);
  }

  /// Read list from storage
  List<T> readList<T>(String key) {
    var res = _box.get(key)?.cast<T>() ?? <T>[];
    return res;
  }

  /// Read value from storage
  Future<void> deleteValue(String key) async {
    await _box.delete(key);
  }

  /// Watch value from storage
  Stream<BoxEvent> watch({required String key}) {
    return _box.watch(key: key);
  }

  /// Close storage
  Future<void> close() async {
    await _box.close();
  }
}

/// Register all Hive adapters here
void _registerAdapters() {
  Hive.registerAdapter<UserInfo>(UserInfoAdapter());
}
