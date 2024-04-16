import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_structure/core/exceptions/data_error.dart';
import 'package:riverpod_structure/core/exceptions/error_codes.dart';
import 'package:riverpod_structure/features/categories/data/dtos/categories_dto.dart';
import 'package:riverpod_structure/features/categories/data/repositories/categories_repo_impl.dart';
import 'package:riverpod_structure/features/categories/domain/usecases/categories_usecase.dart';

part 'categories.freezed.dart';
part 'categories.g.dart';
part 'categories_state.dart';

@riverpod
class Categories extends _$Categories {
  @override
  CategoriesState build() {
    init();
    return const CategoriesInitial();
  }

  Future<void> init() async {
    await Future.delayed(Duration.zero);
    fetchCategories(limit: 10);
  }

  FutureOr<bool> fetchCategories({
    required int limit,
  }) async {
    final repo = ref.read(categoriesRepoProvider);
    final usecase = ref.read(categoriesUsecaseProvider(repo));

    state = CategoriesLoading(
      listCategories: state.listCategories,
    );
    try {
      final res = await usecase.getCategories(
        limit: limit,
      );
      return res.fold(
        (l) {
          state = CategoriesError(DataError(code: l.code));
          return false;
        },
        (r) {
          state = CategoriesSuccess(
            listCategories: r,
          );
          return true;
        },
      );
    } catch (e) {
      state = const CategoriesError(DataError(code: ErrorCodes.unknownError));
      return false;
    }
  }
}
