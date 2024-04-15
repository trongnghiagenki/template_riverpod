// FILEPATH: /Users/nghia/project/riverpod_structure/test/features/authentication/presentation/providers/login_state_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_structure/core/core.dart';
import 'package:riverpod_structure/features/authentication/presentation/providers/login.dart';

void main() {
  group('LoginState', () {
    test('should create Initial state', () {
      const state = LoginState.initial();
      expect(state, isA<Initial>());
    });

    test('should create Loading state', () {
      const state = LoginState.loading();
      expect(state, isA<Loading>());
    });

    test('should create Success state', () {
      const state = LoginState.success();
      expect(state, isA<Success>());
    });

    test('should create Error state', () {
      const error = DataError();
      const state = LoginState.error(error);
      expect(state, isA<Error>());
    });
  });

  group('LoginStateX', () {
    test('should check if state is Initial', () {
      const state = LoginState.initial();
      expect(state.isInitial, isTrue);
      expect(state.isLoading, isFalse);
      expect(state.isSuccess, isFalse);
      expect(state.isError, isFalse);
    });

    test('should check if state is Loading', () {
      const state = LoginState.loading();
      expect(state.isInitial, isFalse);
      expect(state.isLoading, isTrue);
      expect(state.isSuccess, isFalse);
      expect(state.isError, isFalse);
    });

    test('should check if state is Success', () {
      const state = LoginState.success();
      expect(state.isInitial, isFalse);
      expect(state.isLoading, isFalse);
      expect(state.isSuccess, isTrue);
      expect(state.isError, isFalse);
    });

    test('should check if state is Error', () {
      const error = DataError();
      const state = LoginState.error(error);
      expect(state.isInitial, isFalse);
      expect(state.isLoading, isFalse);
      expect(state.isSuccess, isFalse);
      expect(state.isError, isTrue);
    });
  });
}
