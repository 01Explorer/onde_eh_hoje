import 'package:dartz/dartz.dart';
import 'package:onde_eh_hoje/layers/domain/entities/user_entity.dart';

abstract class CreateUserUsecase {
  Future<Either<Exception, User>> call(String name, String email);
}
