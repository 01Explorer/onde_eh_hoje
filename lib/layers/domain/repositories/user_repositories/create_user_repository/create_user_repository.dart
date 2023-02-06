import 'package:dartz/dartz.dart';
import '../../../entities/user_entity.dart';

abstract class CreateUserRepository {
  Future<Either<Exception, User>> call(User user);
}
