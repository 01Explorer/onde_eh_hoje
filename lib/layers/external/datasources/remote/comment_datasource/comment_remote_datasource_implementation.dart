import 'package:dartz/dartz.dart';
import '../../../../domain/entities/comment_entity.dart';
import '../../../../domain/services/http_service/http_service.dart';
import '../../../../domain/utils/utils.dart';
import '../../../../infra/datasources/remote/comment_datasource/comment_remote_datasource.dart';

class CommentRemoteDataSourceImplementation implements CommentRemoteDataSource {
  final HttpService httpService;

  CommentRemoteDataSourceImplementation(this.httpService);
  @override
  Future<Either<Exception, void>> deleteComment(String id) async {
    var response = await httpService
        .delete(Utils.deleteCommentApiEndpoint, queryParameters: {'id': id});
    if (response.statusCode == null) {
      return left(Exception('Failed'));
    }
    return right(null);
  }

  @override
  Future<Either<Exception, List<Comment>>> fetchAllComments() async {
    var response = await httpService.get(Utils.getAllCommentApiEndpoint);
    if (response.statusCode != null) {
      List<Comment> commentList = [];
      for (var comment in response.data['comments']) {
        commentList.add(Comment.fromJson(comment));
      }
      return right(commentList);
    }
    return left(Exception('Failed'));
  }

  @override
  Future<Either<Exception, Comment>> fetchCommentById(String id) async {
    var response = await httpService
        .get(Utils.getCommentApiEndpoint, queryParameters: {'id': id});
    if (response.statusCode != null) {
      return right(Comment.fromJson(response.data));
    }
    return left(Exception('Failed'));
  }

  @override
  Future<Either<Exception, List<Comment>>> fetchCommentsByPlace(
      String id) async {
    var response = await httpService
        .get(Utils.getCommentByPlaceApiEndpoint, queryParameters: {'id': id});
    if (response.statusCode != null) {
      List<Comment> commentList = [];
      for (var comment in response.data['comments']) {
        commentList.add(Comment.fromJson(comment));
      }
      return right(commentList);
    }
    return left(Exception('Failed'));
  }

  @override
  Future<Either<Exception, List<Comment>>> fetchCommentsByUser(
      String id) async {
    var response = await httpService
        .get(Utils.getCommentByUserApiEndpoint, queryParameters: {'id': id});
    if (response.statusCode != null) {
      List<Comment> commentList = [];
      for (var comment in response.data['comments']) {
        commentList.add(Comment.fromJson(comment));
      }
      return right(commentList);
    }
    return left(Exception('Failed'));
  }

  @override
  Future<Either<Exception, Comment>> postComment(Comment comment) async {
    var response = await httpService.post(Utils.postCommentApiEndpoint,
        data: comment.toJson());

    if (response.statusCode != null) {
      return right(Comment.fromJson(response.data));
    }
    return left(Exception('Failed'));
  }
}
