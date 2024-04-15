// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authUsecaseHash() => r'809a0f95b5b6591833e381c17f418318e12974c3';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [authUsecase].
@ProviderFor(authUsecase)
const authUsecaseProvider = AuthUsecaseFamily();

/// See also [authUsecase].
class AuthUsecaseFamily extends Family<AuthUsecase> {
  /// See also [authUsecase].
  const AuthUsecaseFamily();

  /// See also [authUsecase].
  AuthUsecaseProvider call(
    AuthRepo authRepo,
  ) {
    return AuthUsecaseProvider(
      authRepo,
    );
  }

  @override
  AuthUsecaseProvider getProviderOverride(
    covariant AuthUsecaseProvider provider,
  ) {
    return call(
      provider.authRepo,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'authUsecaseProvider';
}

/// See also [authUsecase].
class AuthUsecaseProvider extends AutoDisposeProvider<AuthUsecase> {
  /// See also [authUsecase].
  AuthUsecaseProvider(
    AuthRepo authRepo,
  ) : this._internal(
          (ref) => authUsecase(
            ref as AuthUsecaseRef,
            authRepo,
          ),
          from: authUsecaseProvider,
          name: r'authUsecaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$authUsecaseHash,
          dependencies: AuthUsecaseFamily._dependencies,
          allTransitiveDependencies:
              AuthUsecaseFamily._allTransitiveDependencies,
          authRepo: authRepo,
        );

  AuthUsecaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.authRepo,
  }) : super.internal();

  final AuthRepo authRepo;

  @override
  Override overrideWith(
    AuthUsecase Function(AuthUsecaseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AuthUsecaseProvider._internal(
        (ref) => create(ref as AuthUsecaseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        authRepo: authRepo,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<AuthUsecase> createElement() {
    return _AuthUsecaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AuthUsecaseProvider && other.authRepo == authRepo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, authRepo.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AuthUsecaseRef on AutoDisposeProviderRef<AuthUsecase> {
  /// The parameter `authRepo` of this provider.
  AuthRepo get authRepo;
}

class _AuthUsecaseProviderElement
    extends AutoDisposeProviderElement<AuthUsecase> with AuthUsecaseRef {
  _AuthUsecaseProviderElement(super.provider);

  @override
  AuthRepo get authRepo => (origin as AuthUsecaseProvider).authRepo;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
