// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dioHash() => r'815d82b7b017740c250c722ece6306221220dcf3';

/// Dio service provider with token
///
/// Copied from [dio].
@ProviderFor(dio)
final dioProvider = AutoDisposeProvider<Dio>.internal(
  dio,
  name: r'dioProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dioHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DioRef = AutoDisposeProviderRef<Dio>;
String _$dioUnauthHash() => r'053f4edfcc94728b9ce3f155f74470cdfdce6a6c';

/// Dio service provider without token
///
/// Copied from [dioUnauth].
@ProviderFor(dioUnauth)
final dioUnauthProvider = AutoDisposeProvider<Dio>.internal(
  dioUnauth,
  name: r'dioUnauthProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dioUnauthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DioUnauthRef = AutoDisposeProviderRef<Dio>;
String _$dioLoginHash() => r'15a874c408d3435624726110748f2ce585cf5fbd';

/// Dio service provider for login request only
///
/// Copied from [dioLogin].
@ProviderFor(dioLogin)
final dioLoginProvider = AutoDisposeProvider<Dio>.internal(
  dioLogin,
  name: r'dioLoginProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dioLoginHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DioLoginRef = AutoDisposeProviderRef<Dio>;
String _$dioServiceHash() => r'c1421e1e3d62ac6a2c0e77ad27e6710aeb7bc347';

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

/// See also [dioService].
@ProviderFor(dioService)
const dioServiceProvider = DioServiceFamily();

/// See also [dioService].
class DioServiceFamily extends Family<DioService> {
  /// See also [dioService].
  const DioServiceFamily();

  /// See also [dioService].
  DioServiceProvider call([
    bool isAuthRequest = true,
    bool isLoginRequest = false,
  ]) {
    return DioServiceProvider(
      isAuthRequest,
      isLoginRequest,
    );
  }

  @override
  DioServiceProvider getProviderOverride(
    covariant DioServiceProvider provider,
  ) {
    return call(
      provider.isAuthRequest,
      provider.isLoginRequest,
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
  String? get name => r'dioServiceProvider';
}

/// See also [dioService].
class DioServiceProvider extends Provider<DioService> {
  /// See also [dioService].
  DioServiceProvider([
    bool isAuthRequest = true,
    bool isLoginRequest = false,
  ]) : this._internal(
          (ref) => dioService(
            ref as DioServiceRef,
            isAuthRequest,
            isLoginRequest,
          ),
          from: dioServiceProvider,
          name: r'dioServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dioServiceHash,
          dependencies: DioServiceFamily._dependencies,
          allTransitiveDependencies:
              DioServiceFamily._allTransitiveDependencies,
          isAuthRequest: isAuthRequest,
          isLoginRequest: isLoginRequest,
        );

  DioServiceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.isAuthRequest,
    required this.isLoginRequest,
  }) : super.internal();

  final bool isAuthRequest;
  final bool isLoginRequest;

  @override
  Override overrideWith(
    DioService Function(DioServiceRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DioServiceProvider._internal(
        (ref) => create(ref as DioServiceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        isAuthRequest: isAuthRequest,
        isLoginRequest: isLoginRequest,
      ),
    );
  }

  @override
  ProviderElement<DioService> createElement() {
    return _DioServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DioServiceProvider &&
        other.isAuthRequest == isAuthRequest &&
        other.isLoginRequest == isLoginRequest;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, isAuthRequest.hashCode);
    hash = _SystemHash.combine(hash, isLoginRequest.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DioServiceRef on ProviderRef<DioService> {
  /// The parameter `isAuthRequest` of this provider.
  bool get isAuthRequest;

  /// The parameter `isLoginRequest` of this provider.
  bool get isLoginRequest;
}

class _DioServiceProviderElement extends ProviderElement<DioService>
    with DioServiceRef {
  _DioServiceProviderElement(super.provider);

  @override
  bool get isAuthRequest => (origin as DioServiceProvider).isAuthRequest;
  @override
  bool get isLoginRequest => (origin as DioServiceProvider).isLoginRequest;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
