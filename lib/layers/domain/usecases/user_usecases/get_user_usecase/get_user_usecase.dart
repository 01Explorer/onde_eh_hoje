import 'package:dartz/dartz.dart';
import 'package:onde_eh_hoje/layers/domain/entities/user_entity.dart';

abstract class GetUserUsecase {
  Future<Either<Exception, List<User>>> getAllUsers();
  Future<Either<Exception, User>> getUserById(String id);
}
