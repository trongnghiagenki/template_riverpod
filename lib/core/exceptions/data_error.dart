import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../core.dart';

class DataError extends Equatable implements Exception {
  const DataError({
    this.code,
    this.message = 'default error message',
    this.mapCode,
  });

  // Error code
  final int? code;
  // Error message
  final String message;
  // Map code
  final String? mapCode;

  factory DataError.unknownError() => const DataError(
        code: ErrorCodes.unknownError,
      );

  factory DataError.defaultApiError() => const DataError(
        code: ErrorCodes.defaultApiError,
      );

  @override
  String toString() {
    return 'DataFailure{errCode: $code, errMessage: $message}';
  }

  static Either<DataError, T> handleDioError<T>(DioException exception) {
    try {
      switch (exception.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return Left(DataError(
            code: ErrorCodes.dioTimeout,
            message: LanguageKey.dioTimeout.tr(),
          ));
        case DioExceptionType.badCertificate:
          return Left(DataError(
            code: ErrorCodes.dioBadCertificate,
            message: exception.response?.statusMessage ??
                LanguageKey.dioBadCertificate.tr(),
          ));
        case DioExceptionType.badResponse:
          if (exception.response != null && exception.response!.isConflict) {
            String mapCode = exception.response!.data['message'];
            return Left(DataError(
              code: exception.response?.statusCode ?? ErrorCodes.dioBadResponse,
              message: exception.response?.statusMessage ??
                  LanguageKey.dioBadResponse.tr(),
              mapCode: mapCode,
            ));
          }
          return Left(DataError(
            code: exception.response?.statusCode ?? ErrorCodes.dioBadResponse,
            message: exception.response?.data['message'] ??
                exception.response?.statusMessage ??
                LanguageKey.dioBadResponse.tr(),
          ));
        case DioExceptionType.cancel:
          return Left(DataError(
            code: ErrorCodes.dioCancel,
            message:
                exception.response?.statusMessage ?? LanguageKey.dioCancel.tr(),
          ));
        case DioExceptionType.connectionError:
          return Left(DataError(
            code: ErrorCodes.dioConnectionError,
            message: exception.response?.statusMessage ??
                LanguageKey.dioConnectionError.tr(),
          ));
        case DioExceptionType.unknown:
          return Left(DataError(
            code: ErrorCodes.dioUnknown,
            message: exception.response?.statusMessage ??
                LanguageKey.dioUnknown.tr(),
          ));
      }
    } catch (e) {
      return Left(DataError.defaultApiError());
    }
  }

  static Either<DataError, T> handleException<T>(Object exception) {
    try {
      if (exception is DataError) {
        return Left(exception);
      } else if (exception is DioException) {
        return handleDioError<T>(exception);
      } else {
        return Left(DataError.defaultApiError());
      }
    } catch (e) {
      return Left(DataError.unknownError());
    }
  }

  @override
  List<Object?> get props => [code, message, mapCode];
}
