import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../core/core.dart';
import '../../router/app_router.dart';
import '../storage/storage_service.dart';

part 'auth_service.g.dart';

@Riverpod(keepAlive: true)
AuthService authService(AuthServiceRef ref) {
  final authService = AuthService.create(ref);
  ref.onDispose(() async {
    await authService.close();
  });
  return authService;
}

class AuthService {
  final _userInfoStreamController = BehaviorSubject<UserInfo?>();
  final talker = Talker();
  late final StorageService? _storageService;
  final AuthServiceRef ref;

  AuthService._create(this.ref);

  /// Create an AuthService instance
  static AuthService create(AuthServiceRef ref) {
    final authService = AuthService._create(ref);
    authService._initialize();
    return authService;
  }

  /// Initialize AuthService
  void _initialize() async {
    // Get StorageService
    _storageService = await ref.read(storageServiceProvider.future);
    assert(_storageService != null, 'StorageService is not initialized!');

    // Watch UserInfo, listen to changes and add to stream
    _storageService?.watch(key: StorageConstants.userInfo).listen((event) {
      _userInfoStreamController.add(event.value);
    });

    // Add initial value
    _userInfoStreamController
        .add(_storageService?.readValue(StorageConstants.userInfo, null));
  }

  /// Close UserInfo stream
  Future<void> close() async {
    await _userInfoStreamController.close();
  }

  /// Get UserInfo
  UserInfo? get userInfo => _userInfoStreamController.value;

  /// Get access token
  String get accessToken => userInfo?.accessToken ?? '';

  /// Get refresh token
  String get refreshToken => userInfo?.refreshToken ?? '';

  /// Check if user is authenticated
  bool get isAuthenticated => accessToken.isNotEmpty;

  /// Update UserInfo
  Future<void> updateUser(UserInfo userInfo) async {
    _storageService?.writeValue(StorageConstants.userInfo, userInfo);
  }

  /// Remove user
  Future<void> removeUser() async {
    await _storageService?.deleteValue(StorageConstants.userInfo);
  }

  /// Logout
  Future<void> logout() async {
    await removeUser();
    BuildContext? context = ref.read(appRouterContextProvider);
    context?.goNamed(AppRoutes.login.name);
  }

  // Refresh token
  Future<bool?> refreshTokens() async {
    final currentRToken = refreshToken;
    if (currentRToken.isEmpty) {
      return false;
    }

    // TODO: Implement fetching new token here
    return null;
  }
}
