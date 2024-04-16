part of 'categories.dart';

@freezed
sealed class CategoriesState with _$CategoriesState {
  const CategoriesState._();
  const factory CategoriesState.categoriesInitial({
    @Default([]) List<CategoriesDto> listCategories,
  }) = CategoriesInitial;
  const factory CategoriesState.loading({
    required List<CategoriesDto> listCategories,
  }) = CategoriesLoading;
  const factory CategoriesState.success({
    required List<CategoriesDto> listCategories,
  }) = CategoriesSuccess;
  const factory CategoriesState.error(DataError error) = CategoriesError;
}

extension CategoriesStateX on CategoriesState {
  bool get isInitial => this is CategoriesInitial;
  bool get isLoading => this is CategoriesLoading;
  bool get isSuccess => this is CategoriesSuccess;
  bool get isError => this is CategoriesError;

  List<CategoriesDto> get listCategories => maybeMap(
        categoriesInitial: (state) => state.listCategories,
        success: (state) => state.listCategories,
        orElse: () => [],
      );
}
