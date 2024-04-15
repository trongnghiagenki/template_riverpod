import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';

abstract class AuthRepo {
  Future<Either<DataError, UserInfo>> login();

  Future<Either<DataError, UserInfo>> getUserInfo();
}
