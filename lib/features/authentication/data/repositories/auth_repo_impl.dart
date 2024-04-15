import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/core.dart';
import '../../../../services/dio/dio_service.dart';
import '../../domain/repositories/auth_repo.dart';
import '../dtos/login_user_dto.dart';
import '../dtos/user_info_dto.dart';
import '../mappers/login_user_mapper.dart';
import '../mappers/user_info_mapper.dart';

part 'auth_repo_impl.g.dart';

@riverpod
AuthRepo authRepo(AuthRepoRef ref) {
  final dio = ref.read(dioProvider);
  final dioLogin = ref.read(dioLoginProvider);
  return AuthRepoImpl(dio: dio, dioLogin: dioLogin);
}

class AuthRepoImpl implements AuthRepo {
  final Dio dio;
  final Dio dioLogin;

  AuthRepoImpl({
    required this.dio,
    required this.dioLogin,
  });

  @override
  Future<Either<DataError, UserInfo>> login() async {
    try {
      // Call login API
      final res = await dioLogin.post(
        'https://api.escuelajs.co/api/v1/auth/login',
        data: {"email": "john@mail.com", "password": "changeme"},
      );

      // Check response
      // If login success, return user info with token
      if (res.isCreated || res.isSuccess) {
        final loginUserDto = LoginUserDto.fromJson(res.data);
        final mapper = LoginUserDtoToUserInfoMapper();
        return Right(mapper(loginUserDto));
      }

      // Return error
      return const Left(
        DataError(
          code: ErrorCodes.loginError,
          message: 'Login failed',
        ),
      );
    } catch (e) {
      return DataError.handleException(e);
    }
  }

  @override
  Future<Either<DataError, UserInfo>> getUserInfo() async {
    try {
      // Call login API
      final res = await dio.get(
        'https://api.escuelajs.co/api/v1/auth/profile',
      );

      // Check response
      // If get user info success, return user info
      if (res.isSuccess) {
        final userInfoDto = UserInfoDto.fromJson(res.data);
        final mapper = UserInfoDtoToUserInfoMapper();
        return Right(mapper(userInfoDto));
      }

      // Return error
      return const Left(
        DataError(
          code: ErrorCodes.getUserInfoError,
          message: 'Get user info failed',
        ),
      );
    } catch (e) {
      return DataError.handleException(e);
    }
  }
}
