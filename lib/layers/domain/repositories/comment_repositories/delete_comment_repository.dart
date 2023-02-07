import 'package:dartz/dartz.dart';

abstract class DeleteCommentRepository {
  Future<Either<Exception, void>> call(String id);
}
