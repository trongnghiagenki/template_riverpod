import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../core/core.dart';
import '../auth/auth_service.dart';
import 'dio_adapter/dio_adapter_stub.dart'
    if (dart.library.io) 'dio_adapter/dio_adapter_mobile.dart'
    if (dart.library.js) 'dio_adapter/dio_adapter_web.dart';

part 'dio_service.g.dart';

/// Dio service provider with token
@riverpod
Dio dio(DioRef ref) {
  final token = ref.read(authServiceProvider).accessToken;
  final dio = ref.read(dioServiceProvider()).dio;
  dio.options.headers.addAll({"Authorization": "Bearer $token"});
  return dio;
}

/// Dio service provider without token
@riverpod
Dio dioUnauth(DioUnauthRef ref) {
  final Dio dio = ref.read(dioServiceProvider(false)).dio;
  return dio;
}

/// Dio service provider for login request only
@riverpod
Dio dioLogin(DioLoginRef ref) {
  final Dio dio = ref.read(dioServiceProvider(false, true)).dio;
  return dio;
}

@Riverpod(keepAlive: true)
DioService dioService(
  DioServiceRef ref, [
  bool isAuthRequest = true,
  bool isLoginRequest = false,
]) {
  return DioService(
    ref: ref,
    isAuthRequest: isAuthRequest,
    isLoginRequest: isLoginRequest,
  );
}

class DioService {
  final DioServiceRef ref;
  final bool isAuthRequest;
  final bool isLoginRequest;
  final Dio dio = DioService._getDio();
  final Talker talker = Talker();

  /// Create an DioService instance
  DioService({
    required this.ref,
    this.isAuthRequest = true,
    this.isLoginRequest = true,
  }) {
    if (!kReleaseMode) {
      dio.interceptors.addAll([
        TalkerDioLogger(
          talker: talker,
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
          ),
        ),
      ]);
    }
    // Add interceptors
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final authService = ref.read(authServiceProvider);
        final String token = authService.accessToken;
        // If this is unauthenticated request, continue
        if (!isAuthRequest || token.isEmpty) {
          return handler.next(options);
        }
        // Check if token is expired
        final isTokenExpired = JwtDecoder.isExpired(token);
        // If token is not expired, continue with current token
        if (!isTokenExpired) {
          return handler.next(options);
        }
        // If token is expired, try to refresh token
        talker.warning('Token is expired, Try to refresh token...');
        final resp = await authService.refreshTokens();
        // If refresh token is successful, continue with new token
        if (resp == true) {
          final newToken = authService.accessToken;
          talker.good('Refresh success, new request token: $newToken');
          final newOptions = options.copyWith(
              headers: options.headers
                ..addAll({"Authorization": "Bearer $newToken"}));
          return handler.next(newOptions);
        }
        // If refresh token is failed, logout
        if (resp == false) {
          talker.error('Refresh token failed, logout...');
          authService.logout();
          return;
        }
        // If refresh token is not handled, reject request
        talker.error('Refresh token not handled, reject request...');
        return handler.reject(DioException(
          requestOptions: options,
          error: 'Refresh token failed',
        ));
      },
      onError: (DioException e, handler) async {
        // If this is not exception from login request
        // and response status code is 401, try to refresh token
        if (!isLoginRequest && e.response?.statusCode == 401) {
          talker.warning('Request token is expired, Try to refresh token...');
          final authService = ref.read(authServiceProvider);
          final resp = await authService.refreshTokens();
          // If refresh token is successful, continue with new token
          if (resp == true) {
            final newToken = authService.accessToken;
            talker.good('Refresh success, new request token: $newToken');
            final newOptions = e.requestOptions.copyWith(
                headers: e.requestOptions.headers
                  ..addAll({"Authorization": "Bearer $newToken"}));
            final Response response = await dio.fetch(newOptions);
            return handler.resolve(response);
          }
          // If refresh token is failed, logout
          if (resp == false) {
            talker.error('Refresh token failed, logout...');
            authService.logout();
            return;
          }
        }
        return handler.next(e);
      },
    ));
  }

  static Dio _getDio() {
    final baseApiUrl = FlavorConfig.instance.variables[FlavorConstants.baseUrl];
    Dio dio = Dio();
    dio.httpClientAdapter = getAdapter();
    dio.options.baseUrl = '$baseApiUrl';
    dio.options.receiveDataWhenStatusError = true;
    dio.options.receiveTimeout = const Duration(seconds: 25);
    dio.options.connectTimeout = const Duration(seconds: 25);
    dio.options.sendTimeout = const Duration(seconds: 25);
    dio.options.contentType = 'application/json';
    return dio;
  }
}
