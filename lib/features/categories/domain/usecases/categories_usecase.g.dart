// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoriesUsecaseHash() => r'0981f070ea5ec709e2f9511d160d6f5b03e735bd';

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

/// See also [categoriesUsecase].
@ProviderFor(categoriesUsecase)
const categoriesUsecaseProvider = CategoriesUsecaseFamily();

/// See also [categoriesUsecase].
class CategoriesUsecaseFamily extends Family<CategoriesUsecase> {
  /// See also [categoriesUsecase].
  const CategoriesUsecaseFamily();

  /// See also [categoriesUsecase].
  CategoriesUsecaseProvider call(
    CategoriesRepo categoriesRepo,
  ) {
    return CategoriesUsecaseProvider(
      categoriesRepo,
    );
  }

  @override
  CategoriesUsecaseProvider getProviderOverride(
    covariant CategoriesUsecaseProvider provider,
  ) {
    return call(
      provider.categoriesRepo,
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
  String? get name => r'categoriesUsecaseProvider';
}

/// See also [categoriesUsecase].
class CategoriesUsecaseProvider extends AutoDisposeProvider<CategoriesUsecase> {
  /// See also [categoriesUsecase].
  CategoriesUsecaseProvider(
    CategoriesRepo categoriesRepo,
  ) : this._internal(
          (ref) => categoriesUsecase(
            ref as CategoriesUsecaseRef,
            categoriesRepo,
          ),
          from: categoriesUsecaseProvider,
          name: r'categoriesUsecaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoriesUsecaseHash,
          dependencies: CategoriesUsecaseFamily._dependencies,
          allTransitiveDependencies:
              CategoriesUsecaseFamily._allTransitiveDependencies,
          categoriesRepo: categoriesRepo,
        );

  CategoriesUsecaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoriesRepo,
  }) : super.internal();

  final CategoriesRepo categoriesRepo;

  @override
  Override overrideWith(
    CategoriesUsecase Function(CategoriesUsecaseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CategoriesUsecaseProvider._internal(
        (ref) => create(ref as CategoriesUsecaseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoriesRepo: categoriesRepo,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<CategoriesUsecase> createElement() {
    return _CategoriesUsecaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoriesUsecaseProvider &&
        other.categoriesRepo == categoriesRepo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoriesRepo.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CategoriesUsecaseRef on AutoDisposeProviderRef<CategoriesUsecase> {
  /// The parameter `categoriesRepo` of this provider.
  CategoriesRepo get categoriesRepo;
}

class _CategoriesUsecaseProviderElement
    extends AutoDisposeProviderElement<CategoriesUsecase>
    with CategoriesUsecaseRef {
  _CategoriesUsecaseProviderElement(super.provider);

  @override
  CategoriesRepo get categoriesRepo =>
      (origin as CategoriesUsecaseProvider).categoriesRepo;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
