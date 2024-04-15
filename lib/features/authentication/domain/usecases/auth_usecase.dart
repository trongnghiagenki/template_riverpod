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
            final resUpdateUser = await getUserInfo();
            return resUpdateUser.fold(
              (l) => Left(l),
              (r) => const Right(true),
            );
          },
        );
      },
    );
  }

  Future<Either<DataError, bool>> getUserInfo() async {
    final res = await authRepo.getUserInfo();
    return res.fold(
      (l) => Left(l),
      (r) async {
        final currentUser = ref.read(authServiceProvider);
        final userInfo = UserInfo(
          accessToken: currentUser.accessToken,
          refreshToken: currentUser.refreshToken,
          id: r.id,
          email: r.email,
          name: r.name,
          avatar: r.avatar,
        );
        await ref.read(authServiceProvider).updateUser(userInfo);
        return const Right(true);
      },
    );
  }
}
