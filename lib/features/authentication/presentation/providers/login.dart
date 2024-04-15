import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/core.dart';
import '../../data/repositories/auth_repo_impl.dart';
import '../../domain/usecases/auth_usecase.dart';

part 'login.freezed.dart';
part 'login.g.dart';
part 'login_state.dart';

@riverpod
class Login extends _$Login {
  @override
  LoginState build() {
    return const Initial();
  }

  Future<void> login() async {
    state = const Loading();
    try {
      final authRepo = ref.read(authRepoProvider);
      final usecase = ref.read(authUsecaseProvider(authRepo));
      final res = await usecase.login();
      res.fold(
        (l) => state = Error(l),
        (r) => state = const Success(),
      );
    } on DataError catch (e) {
      state = Error(e);
    }
  }
}
