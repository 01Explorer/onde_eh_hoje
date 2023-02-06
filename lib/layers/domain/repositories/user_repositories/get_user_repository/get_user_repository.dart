import 'package:dartz/dartz.dart';

import '../../../entities/user_entity.dart';

abstract class GetUserRepository {
  Future<Either<Exception, List<User>>> getAllUsers();
  Future<Either<Exception, User>> getUserById(String id);
}
