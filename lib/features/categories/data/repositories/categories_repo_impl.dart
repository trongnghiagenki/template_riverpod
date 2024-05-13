import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/core.dart';
import '../../../../services/dio/dio_service.dart';
import '../../domain/repositories/categories_repo.dart';
import '../dtos/categories_dto.dart';

part 'categories_repo_impl.g.dart';

@riverpod
CategoriesRepo categoriesRepo(CategoriesRepoRef ref) {
  final dio = ref.read(dioUnauthProvider);

  return CategoriesRepoImpl(
    dioUnauth: dio,
  );
}

class CategoriesRepoImpl implements CategoriesRepo {
  final Dio dioUnauth;

  CategoriesRepoImpl({
    required this.dioUnauth,
  });

  @override
  Future<Either<DataError, List<CategoriesDto>>> getCategories(
      {int? limit}) async {
    try {
      // Call login API
      final res = await dioUnauth.get(
        'https://api.escuelajs.co/api/v1/categories',
        queryParameters: {"limit": limit},
      );

      // Check response

      if (res.isCreated || res.isSuccess) {
        var data = (res.data as List<dynamic>)
            .map((e) => CategoriesDto.fromJson(e as Map<String, dynamic>))
            .toList();
        return Right(data);
      }

      // Return error
      return const Left(
        DataError(
          code: ErrorCodes.getCategoriesError,
          message: 'Get categories failed',
        ),
      );
    } catch (e) {
      return DataError.handleException(e);
    }
  }
}
