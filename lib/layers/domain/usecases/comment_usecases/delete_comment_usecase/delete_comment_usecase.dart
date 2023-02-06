import 'package:dartz/dartz.dart';

abstract class DeleteCommentUsecase {
  Future<Either<Exception, void>> call(String id);
}
