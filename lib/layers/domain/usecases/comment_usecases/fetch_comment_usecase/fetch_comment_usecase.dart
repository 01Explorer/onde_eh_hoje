import 'package:dartz/dartz.dart';
import 'package:onde_eh_hoje/layers/domain/entities/comment_entity.dart';

abstract class FetchCommentUsecase {
  Future<Either<Exception, List<Comment>>> fetchAllComments();
  Future<Either<Exception, List<Comment>>> fetchCommentsByPlace(String id);
  Future<Either<Exception, List<Comment>>> fetchCommentsByUser(String id);
  Future<Either<Exception, Comment>> fetchCommentById(String id);
}
