// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoriesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CategoriesDto> listCategories)
        categoriesInitial,
    required TResult Function(List<CategoriesDto> listCategories) loading,
    required TResult Function(List<CategoriesDto> listCategories) success,
    required TResult Function(DataError error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CategoriesDto> listCategories)? categoriesInitial,
    TResult? Function(List<CategoriesDto> listCategories)? loading,
    TResult? Function(List<CategoriesDto> listCategories)? success,
    TResult? Function(DataError error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoriesDto> listCategories)? categoriesInitial,
    TResult Function(List<CategoriesDto> listCategories)? loading,
    TResult Function(List<CategoriesDto> listCategories)? success,
    TResult Function(DataError error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoriesInitial value) categoriesInitial,
    required TResult Function(CategoriesLoading value) loading,
    required TResult Function(CategoriesSuccess value) success,
    required TResult Function(CategoriesError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoriesInitial value)? categoriesInitial,
    TResult? Function(CategoriesLoading value)? loading,
    TResult? Function(CategoriesSuccess value)? success,
    TResult? Function(CategoriesError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoriesInitial value)? categoriesInitial,
    TResult Function(CategoriesLoading value)? loading,
    TResult Function(CategoriesSuccess value)? success,
    TResult Function(CategoriesError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesStateCopyWith<$Res> {
  factory $CategoriesStateCopyWith(
          CategoriesState value, $Res Function(CategoriesState) then) =
      _$CategoriesStateCopyWithImpl<$Res, CategoriesState>;
}

/// @nodoc
class _$CategoriesStateCopyWithImpl<$Res, $Val extends CategoriesState>
    implements $CategoriesStateCopyWith<$Res> {
  _$CategoriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CategoriesInitialImplCopyWith<$Res> {
  factory _$$CategoriesInitialImplCopyWith(_$CategoriesInitialImpl value,
          $Res Function(_$CategoriesInitialImpl) then) =
      __$$CategoriesInitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CategoriesDto> listCategories});
}

/// @nodoc
class __$$CategoriesInitialImplCopyWithImpl<$Res>
    extends _$CategoriesStateCopyWithImpl<$Res, _$CategoriesInitialImpl>
    implements _$$CategoriesInitialImplCopyWith<$Res> {
  __$$CategoriesInitialImplCopyWithImpl(_$CategoriesInitialImpl _value,
      $Res Function(_$CategoriesInitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listCategories = null,
  }) {
    return _then(_$CategoriesInitialImpl(
      listCategories: null == listCategories
          ? _value._listCategories
          : listCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoriesDto>,
    ));
  }
}

/// @nodoc

class _$CategoriesInitialImpl extends CategoriesInitial {
  const _$CategoriesInitialImpl(
      {final List<CategoriesDto> listCategories = const []})
      : _listCategories = listCategories,
        super._();

  final List<CategoriesDto> _listCategories;
  @override
  @JsonKey()
  List<CategoriesDto> get listCategories {
    if (_listCategories is EqualUnmodifiableListView) return _listCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listCategories);
  }

  @override
  String toString() {
    return 'CategoriesState.categoriesInitial(listCategories: $listCategories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoriesInitialImpl &&
            const DeepCollectionEquality()
                .equals(other._listCategories, _listCategories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_listCategories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoriesInitialImplCopyWith<_$CategoriesInitialImpl> get copyWith =>
      __$$CategoriesInitialImplCopyWithImpl<_$CategoriesInitialImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CategoriesDto> listCategories)
        categoriesInitial,
    required TResult Function(List<CategoriesDto> listCategories) loading,
    required TResult Function(List<CategoriesDto> listCategories) success,
    required TResult Function(DataError error) error,
  }) {
    return categoriesInitial(listCategories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CategoriesDto> listCategories)? categoriesInitial,
    TResult? Function(List<CategoriesDto> listCategories)? loading,
    TResult? Function(List<CategoriesDto> listCategories)? success,
    TResult? Function(DataError error)? error,
  }) {
    return categoriesInitial?.call(listCategories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoriesDto> listCategories)? categoriesInitial,
    TResult Function(List<CategoriesDto> listCategories)? loading,
    TResult Function(List<CategoriesDto> listCategories)? success,
    TResult Function(DataError error)? error,
    required TResult orElse(),
  }) {
    if (categoriesInitial != null) {
      return categoriesInitial(listCategories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoriesInitial value) categoriesInitial,
    required TResult Function(CategoriesLoading value) loading,
    required TResult Function(CategoriesSuccess value) success,
    required TResult Function(CategoriesError value) error,
  }) {
    return categoriesInitial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoriesInitial value)? categoriesInitial,
    TResult? Function(CategoriesLoading value)? loading,
    TResult? Function(CategoriesSuccess value)? success,
    TResult? Function(CategoriesError value)? error,
  }) {
    return categoriesInitial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoriesInitial value)? categoriesInitial,
    TResult Function(CategoriesLoading value)? loading,
    TResult Function(CategoriesSuccess value)? success,
    TResult Function(CategoriesError value)? error,
    required TResult orElse(),
  }) {
    if (categoriesInitial != null) {
      return categoriesInitial(this);
    }
    return orElse();
  }
}

abstract class CategoriesInitial extends CategoriesState {
  const factory CategoriesInitial({final List<CategoriesDto> listCategories}) =
      _$CategoriesInitialImpl;
  const CategoriesInitial._() : super._();

  List<CategoriesDto> get listCategories;
  @JsonKey(ignore: true)
  _$$CategoriesInitialImplCopyWith<_$CategoriesInitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategoriesLoadingImplCopyWith<$Res> {
  factory _$$CategoriesLoadingImplCopyWith(_$CategoriesLoadingImpl value,
          $Res Function(_$CategoriesLoadingImpl) then) =
      __$$CategoriesLoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CategoriesDto> listCategories});
}

/// @nodoc
class __$$CategoriesLoadingImplCopyWithImpl<$Res>
    extends _$CategoriesStateCopyWithImpl<$Res, _$CategoriesLoadingImpl>
    implements _$$CategoriesLoadingImplCopyWith<$Res> {
  __$$CategoriesLoadingImplCopyWithImpl(_$CategoriesLoadingImpl _value,
      $Res Function(_$CategoriesLoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listCategories = null,
  }) {
    return _then(_$CategoriesLoadingImpl(
      listCategories: null == listCategories
          ? _value._listCategories
          : listCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoriesDto>,
    ));
  }
}

/// @nodoc

class _$CategoriesLoadingImpl extends CategoriesLoading {
  const _$CategoriesLoadingImpl(
      {required final List<CategoriesDto> listCategories})
      : _listCategories = listCategories,
        super._();

  final List<CategoriesDto> _listCategories;
  @override
  List<CategoriesDto> get listCategories {
    if (_listCategories is EqualUnmodifiableListView) return _listCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listCategories);
  }

  @override
  String toString() {
    return 'CategoriesState.loading(listCategories: $listCategories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoriesLoadingImpl &&
            const DeepCollectionEquality()
                .equals(other._listCategories, _listCategories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_listCategories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoriesLoadingImplCopyWith<_$CategoriesLoadingImpl> get copyWith =>
      __$$CategoriesLoadingImplCopyWithImpl<_$CategoriesLoadingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CategoriesDto> listCategories)
        categoriesInitial,
    required TResult Function(List<CategoriesDto> listCategories) loading,
    required TResult Function(List<CategoriesDto> listCategories) success,
    required TResult Function(DataError error) error,
  }) {
    return loading(listCategories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CategoriesDto> listCategories)? categoriesInitial,
    TResult? Function(List<CategoriesDto> listCategories)? loading,
    TResult? Function(List<CategoriesDto> listCategories)? success,
    TResult? Function(DataError error)? error,
  }) {
    return loading?.call(listCategories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoriesDto> listCategories)? categoriesInitial,
    TResult Function(List<CategoriesDto> listCategories)? loading,
    TResult Function(List<CategoriesDto> listCategories)? success,
    TResult Function(DataError error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(listCategories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoriesInitial value) categoriesInitial,
    required TResult Function(CategoriesLoading value) loading,
    required TResult Function(CategoriesSuccess value) success,
    required TResult Function(CategoriesError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoriesInitial value)? categoriesInitial,
    TResult? Function(CategoriesLoading value)? loading,
    TResult? Function(CategoriesSuccess value)? success,
    TResult? Function(CategoriesError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoriesInitial value)? categoriesInitial,
    TResult Function(CategoriesLoading value)? loading,
    TResult Function(CategoriesSuccess value)? success,
    TResult Function(CategoriesError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CategoriesLoading extends CategoriesState {
  const factory CategoriesLoading(
          {required final List<CategoriesDto> listCategories}) =
      _$CategoriesLoadingImpl;
  const CategoriesLoading._() : super._();

  List<CategoriesDto> get listCategories;
  @JsonKey(ignore: true)
  _$$CategoriesLoadingImplCopyWith<_$CategoriesLoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategoriesSuccessImplCopyWith<$Res> {
  factory _$$CategoriesSuccessImplCopyWith(_$CategoriesSuccessImpl value,
          $Res Function(_$CategoriesSuccessImpl) then) =
      __$$CategoriesSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CategoriesDto> listCategories});
}

/// @nodoc
class __$$CategoriesSuccessImplCopyWithImpl<$Res>
    extends _$CategoriesStateCopyWithImpl<$Res, _$CategoriesSuccessImpl>
    implements _$$CategoriesSuccessImplCopyWith<$Res> {
  __$$CategoriesSuccessImplCopyWithImpl(_$CategoriesSuccessImpl _value,
      $Res Function(_$CategoriesSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listCategories = null,
  }) {
    return _then(_$CategoriesSuccessImpl(
      listCategories: null == listCategories
          ? _value._listCategories
          : listCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoriesDto>,
    ));
  }
}

/// @nodoc

class _$CategoriesSuccessImpl extends CategoriesSuccess {
  const _$CategoriesSuccessImpl(
      {required final List<CategoriesDto> listCategories})
      : _listCategories = listCategories,
        super._();

  final List<CategoriesDto> _listCategories;
  @override
  List<CategoriesDto> get listCategories {
    if (_listCategories is EqualUnmodifiableListView) return _listCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listCategories);
  }

  @override
  String toString() {
    return 'CategoriesState.success(listCategories: $listCategories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoriesSuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._listCategories, _listCategories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_listCategories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoriesSuccessImplCopyWith<_$CategoriesSuccessImpl> get copyWith =>
      __$$CategoriesSuccessImplCopyWithImpl<_$CategoriesSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CategoriesDto> listCategories)
        categoriesInitial,
    required TResult Function(List<CategoriesDto> listCategories) loading,
    required TResult Function(List<CategoriesDto> listCategories) success,
    required TResult Function(DataError error) error,
  }) {
    return success(listCategories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CategoriesDto> listCategories)? categoriesInitial,
    TResult? Function(List<CategoriesDto> listCategories)? loading,
    TResult? Function(List<CategoriesDto> listCategories)? success,
    TResult? Function(DataError error)? error,
  }) {
    return success?.call(listCategories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoriesDto> listCategories)? categoriesInitial,
    TResult Function(List<CategoriesDto> listCategories)? loading,
    TResult Function(List<CategoriesDto> listCategories)? success,
    TResult Function(DataError error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(listCategories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoriesInitial value) categoriesInitial,
    required TResult Function(CategoriesLoading value) loading,
    required TResult Function(CategoriesSuccess value) success,
    required TResult Function(CategoriesError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoriesInitial value)? categoriesInitial,
    TResult? Function(CategoriesLoading value)? loading,
    TResult? Function(CategoriesSuccess value)? success,
    TResult? Function(CategoriesError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoriesInitial value)? categoriesInitial,
    TResult Function(CategoriesLoading value)? loading,
    TResult Function(CategoriesSuccess value)? success,
    TResult Function(CategoriesError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class CategoriesSuccess extends CategoriesState {
  const factory CategoriesSuccess(
          {required final List<CategoriesDto> listCategories}) =
      _$CategoriesSuccessImpl;
  const CategoriesSuccess._() : super._();

  List<CategoriesDto> get listCategories;
  @JsonKey(ignore: true)
  _$$CategoriesSuccessImplCopyWith<_$CategoriesSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategoriesErrorImplCopyWith<$Res> {
  factory _$$CategoriesErrorImplCopyWith(_$CategoriesErrorImpl value,
          $Res Function(_$CategoriesErrorImpl) then) =
      __$$CategoriesErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DataError error});
}

/// @nodoc
class __$$CategoriesErrorImplCopyWithImpl<$Res>
    extends _$CategoriesStateCopyWithImpl<$Res, _$CategoriesErrorImpl>
    implements _$$CategoriesErrorImplCopyWith<$Res> {
  __$$CategoriesErrorImplCopyWithImpl(
      _$CategoriesErrorImpl _value, $Res Function(_$CategoriesErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$CategoriesErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as DataError,
    ));
  }
}

/// @nodoc

class _$CategoriesErrorImpl extends CategoriesError {
  const _$CategoriesErrorImpl(this.error) : super._();

  @override
  final DataError error;

  @override
  String toString() {
    return 'CategoriesState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoriesErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoriesErrorImplCopyWith<_$CategoriesErrorImpl> get copyWith =>
      __$$CategoriesErrorImplCopyWithImpl<_$CategoriesErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CategoriesDto> listCategories)
        categoriesInitial,
    required TResult Function(List<CategoriesDto> listCategories) loading,
    required TResult Function(List<CategoriesDto> listCategories) success,
    required TResult Function(DataError error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CategoriesDto> listCategories)? categoriesInitial,
    TResult? Function(List<CategoriesDto> listCategories)? loading,
    TResult? Function(List<CategoriesDto> listCategories)? success,
    TResult? Function(DataError error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoriesDto> listCategories)? categoriesInitial,
    TResult Function(List<CategoriesDto> listCategories)? loading,
    TResult Function(List<CategoriesDto> listCategories)? success,
    TResult Function(DataError error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoriesInitial value) categoriesInitial,
    required TResult Function(CategoriesLoading value) loading,
    required TResult Function(CategoriesSuccess value) success,
    required TResult Function(CategoriesError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoriesInitial value)? categoriesInitial,
    TResult? Function(CategoriesLoading value)? loading,
    TResult? Function(CategoriesSuccess value)? success,
    TResult? Function(CategoriesError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoriesInitial value)? categoriesInitial,
    TResult Function(CategoriesLoading value)? loading,
    TResult Function(CategoriesSuccess value)? success,
    TResult Function(CategoriesError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CategoriesError extends CategoriesState {
  const factory CategoriesError(final DataError error) = _$CategoriesErrorImpl;
  const CategoriesError._() : super._();

  DataError get error;
  @JsonKey(ignore: true)
  _$$CategoriesErrorImplCopyWith<_$CategoriesErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
