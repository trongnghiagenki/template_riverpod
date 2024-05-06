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
  return AuthRepoImpl(ref);
}

class AuthRepoImpl implements AuthRepo {
  final AuthRepoRef ref;

  AuthRepoImpl(this.ref);

  @override
  Future<Either<DataError, UserInfo>> login() async {
    try {
      // Call login API
      final dioLogin = ref.read(dioLoginProvider);
      final resp = await dioLogin.post(
        'https://api.escuelajs.co/api/v1/auth/login',
        data: {"email": "john@mail.com", "password": "changeme"},
      );

      // Check response
      // If login success, return user info with token
      if (resp.isCreated || resp.isSuccess) {
        final loginUserDto = LoginUserDto.fromJson(resp.data);
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
      final dio = ref.read(dioProvider);
      final resp = await dio.get(
        'https://api.escuelajs.co/api/v1/auth/profile',
      );

      // Check response
      // If get user info success, return user info
      if (resp.isSuccess) {
        final userInfoDto = UserInfoDto.fromJson(resp.data);
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
