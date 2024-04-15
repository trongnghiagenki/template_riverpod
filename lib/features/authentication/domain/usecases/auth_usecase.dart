import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/core.dart';
import '../../../../services/auth/auth_service.dart';
import '../repositories/auth_repo.dart';

part 'auth_usecase.g.dart';

@riverpod
AuthUsecase authUsecase(AuthUsecaseRef ref, AuthRepo authRepo) {
  return AuthUsecase(ref, authRepo);
}

class AuthUsecase {
  final AuthUsecaseRef ref;
  final AuthRepo authRepo;

  AuthUsecase(
    this.ref,
    this.authRepo,
  );

  Future<Either<DataError, bool>> login() async {
    final res = await authRepo.login();
    return res.fold(
      (l) => Left(l),
      (tokenData) async {
        await ref.read(authServiceProvider).updateUser(tokenData);
        final userInfoRes = await authRepo.getUserInfo();
        return userInfoRes.fold(
          (l) => Left(l),
          (r) async {
            final userInfo = UserInfo(
              accessToken: tokenData.accessToken,
              refreshToken: tokenData.refreshToken,
              id: r.id,
              email: r.email,
              name: r.name,
              avatar: r.avatar,
            );
            await ref.read(authServiceProvider).updateUser(userInfo);
            return const Right(true);
          },
        );
      },
    );
  }
}
