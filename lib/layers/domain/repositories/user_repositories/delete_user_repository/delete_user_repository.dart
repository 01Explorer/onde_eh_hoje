import 'package:dartz/dartz.dart';

abstract class DeleteUserRepository {
  Future<Either<Exception, bool>> call(String id);
}
