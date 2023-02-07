import 'package:dartz/dartz.dart';

import '../../../../domain/entities/comment_entity.dart';

abstract class CommentRemoteDataSource {
  Future<Either<Exception, void>> deleteComment(String id);
  Future<Either<Exception, List<Comment>>> fetchAllComments();
  Future<Either<Exception, List<Comment>>> fetchCommentsByPlace(String id);
  Future<Either<Exception, List<Comment>>> fetchCommentsByUser(String id);
  Future<Either<Exception, Comment>> fetchCommentById(String id);
  Future<Either<Exception, Comment>> postComment(Comment comment);
}
