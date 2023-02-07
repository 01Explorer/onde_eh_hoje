import 'package:dartz/dartz.dart';
import '../../../../domain/entities/user_entity.dart';

abstract class UserRemoteDataSource {
  Future<Either<Exception, User>> signUpUser(User user);
  Future<Either<Exception, List<User>>> getAllUsers();
  Future<Either<Exception, User>> getUserById(String id);
  Future<Either<Exception, bool>> delete(String id);
  Future<Either<Exception, User>> edit(String id, String name);
}
