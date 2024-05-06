import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';
import '../../data/dtos/categories_dto.dart';

abstract class CategoriesRepo {
  Future<Either<DataError, List<CategoriesDto>>> getCategories({int? limit});
}
