import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/core.dart';
import '../../data/dtos/categories_dto.dart';
import '../repositories/categories_repo.dart';

part 'categories_usecase.g.dart';

@riverpod
CategoriesUsecase categoriesUsecase(
    CategoriesUsecaseRef ref, CategoriesRepo categoriesRepo) {
  return CategoriesUsecase(ref, categoriesRepo);
}

class CategoriesUsecase {
  final CategoriesUsecaseRef ref;
  final CategoriesRepo categoriesRepo;

  CategoriesUsecase(
    this.ref,
    this.categoriesRepo,
  );

  Future<Either<DataError, List<CategoriesDto>>> getCategories(
      {int? limit}) async {
    final res = await categoriesRepo.getCategories();

    return res.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
