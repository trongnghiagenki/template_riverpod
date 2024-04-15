part of 'login.dart';

@freezed
sealed class LoginState with _$LoginState {
  const LoginState._();
  const factory LoginState.initial() = Initial;
  const factory LoginState.loading() = Loading;
  const factory LoginState.success() = Success;
  const factory LoginState.error(DataError error) = Error;
}

extension LoginStateX on LoginState {
  bool get isInitial => this is Initial;
  bool get isLoading => this is Loading;
  bool get isSuccess => this is Success;
  bool get isError => this is Error;
}
