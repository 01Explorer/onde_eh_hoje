import 'package:dartz/dartz.dart';
import '../../entities/comment_entity.dart';

abstract class PostCommentRepository {
  Future<Either<Exception, Comment>> call(Comment comment);
}