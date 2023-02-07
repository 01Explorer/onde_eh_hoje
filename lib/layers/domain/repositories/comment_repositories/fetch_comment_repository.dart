import 'package:dartz/dartz.dart';
import '../../entities/comment_entity.dart';

abstract class FetchCommentRepository {
  Future<Either<Exception, List<Comment>>> fetchAllComments();
  Future<Either<Exception, List<Comment>>> fetchCommentsByPlace(String id);
  Future<Either<Exception, List<Comment>>> fetchCommentsByUser(String id);
  Future<Either<Exception, Comment>> fetchCommentById(String id);
}
