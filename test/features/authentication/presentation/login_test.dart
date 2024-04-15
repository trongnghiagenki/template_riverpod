import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod_structure/core/core.dart';
import 'package:riverpod_structure/features/authentication/data/repositories/auth_repo_impl.dart';
import 'package:riverpod_structure/features/authentication/domain/repositories/auth_repo.dart';
import 'package:riverpod_structure/features/authentication/domain/usecases/auth_usecase.dart';
import 'package:riverpod_structure/features/authentication/presentation/providers/login.dart';

class MockAuthUsecase extends Mock implements AuthUsecase {}

class MockAuthRepo extends Mock implements AuthRepo {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Create a ProviderContainer to hold the mockAuthUsecase and mockAuthRepo
  ProviderContainer makeProviderContainer(
      MockAuthUsecase authUsecase, MockAuthRepo mockRepo) {
    final container = ProviderContainer(
      overrides: [
        authRepoProvider.overrideWithValue(mockRepo),
        authUsecaseProvider(mockRepo).overrideWithValue(authUsecase),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  test('initial state should be Initial', () {
    // === Setup ===
    // Create a mockAuthUsecase and mockAuthRepo
    final mockAuthUsecase = MockAuthUsecase();
    final mockAuthRepo = MockAuthRepo();
    // Create a ProviderContainer with the mockAuthUsecase and mockAuthRepo
    final container = makeProviderContainer(mockAuthUsecase, mockAuthRepo);
    // Create a listener which will be called whenever the state changes
    final listener = Listener<LoginState>();
    container.listen(
      loginProvider,
      listener.call,
      fireImmediately: true,
    );

    // === Test ===
    // Verify that the listener was called with the initial state (Initial)
    verify(() => listener.call(null, const Initial())).called(1);
    // Verify that the listener was not called with any other state
    verifyNoMoreInteractions(listener);
    // Verify that the login method was not called
    verifyNever(() => mockAuthRepo.login());
  });

  test('when login success, state should be Success', () async {
    // === Setup ===
    // Create a mockAuthUsecase and mockAuthRepo
    final mockAuthUsecase = MockAuthUsecase();
    final mockAuthRepo = MockAuthRepo();
    // Create a ProviderContainer with the mockAuthUsecase and mockAuthRepo
    final container = makeProviderContainer(mockAuthUsecase, mockAuthRepo);
    // Create a listener which will be called whenever the state changes
    final listener = Listener<LoginState>();
    container.listen(
      loginProvider,
      listener.call,
      fireImmediately: true,
    );
    // When the login method is called, return a successful result
    when(() => mockAuthUsecase.login())
        .thenAnswer((_) async => const Right(true));

    // === Test ===
    // Verify that the listener was called with the initial state (Initial)
    verify(() => listener.call(null, const Initial())).called(1);
    // Get the provider and call the login method
    await container.read(loginProvider.notifier).login();
    // Verify that the listener was called with the Loading state
    // and then the Success state
    verifyInOrder([
      () => listener.call(const Initial(), const Loading()),
      () => listener.call(const Loading(), const Success()),
    ]);
    // Verify that the listener was not called with any other state
    verifyNoMoreInteractions(listener);
    // Verify that the login method was called 1 time
    verify(() => mockAuthUsecase.login()).called(1);
  });

  test('when login fails, state should be Error', () async {
    // === Setup ===
    // Create a mockAuthUsecase and mockAuthRepo
    final mockAuthUsecase = MockAuthUsecase();
    final mockAuthRepo = MockAuthRepo();
    // Create a ProviderContainer with the mockAuthUsecase and mockAuthRepo
    final container = makeProviderContainer(mockAuthUsecase, mockAuthRepo);
    // Create a listener which will be called whenever the state changes
    final listener = Listener<LoginState>();
    container.listen(
      loginProvider,
      listener.call,
      fireImmediately: true,
    );
    // Error result
    const error = DataError(
      code: ErrorCodes.loginError,
    );
    // When the login method is called, return an error result
    when(() => mockAuthUsecase.login()).thenAnswer(
      (_) async => const Left(error),
    );

    // === Test ===
    // Verify that the listener was called with the initial state (Initial)
    verify(() => listener.call(null, const Initial())).called(1);
    // Get the provider and call the login method
    await container.read(loginProvider.notifier).login();
    // Verify that the listener was called with the Loading state
    // and then the Error state
    verifyInOrder([
      () => listener.call(const Initial(), const Loading()),
      () => listener.call(const Loading(), const Error(error)),
    ]);
    // Verify that the listener was not called with any other state
    verifyNoMoreInteractions(listener);
    // Verify that the login method was called 1 time
    verify(() => mockAuthUsecase.login()).called(1);
  });
}
