import 'package:dartz/dartz.dart';

abstract class DeleteUserUsecase {
  Future<Either<Exception, bool>> call(String id);
}
