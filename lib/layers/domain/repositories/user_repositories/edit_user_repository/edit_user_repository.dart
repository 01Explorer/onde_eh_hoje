import 'package:dartz/dartz.dart';
import '../../../entities/user_entity.dart';

abstract class EditUserRepository {
  Future<Either<Exception, User>> call(String id, String name);
}
