import 'package:dartz/dartz.dart';
import '../../../../domain/entities/comment_entity.dart';
import '../../../../domain/repositories/comment_repositories/fetch_comment_repository.dart';
import '../../../datasources/remote/comment_datasource/comment_remote_datasource.dart';

class FetchCommentRepositoryImplementation implements FetchCommentRepository {
  final CommentRemoteDataSource dataSource;

  FetchCommentRepositoryImplementation(this.dataSource);
  @override
  Future<Either<Exception, List<Comment>>> fetchAllComments() async {
    var response = await dataSource.fetchAllComments();
    return response.fold((l) => left(l), (r) => right(r));
  }

  @override
  Future<Either<Exception, Comment>> fetchCommentById(String id) async {
    var response = await dataSource.fetchCommentById(id);
    return response.fold((l) => left(l), (r) => right(r));
  }

  @override
  Future<Either<Exception, List<Comment>>> fetchCommentsByPlace(
      String id) async {
    var response = await dataSource.fetchCommentsByPlace(id);
    return response.fold((l) => left(l), (r) => right(r));
  }

  @override
  Future<Either<Exception, List<Comment>>> fetchCommentsByUser(
      String id) async {
    var response = await dataSource.fetchCommentsByUser(id);
    return response.fold((l) => left(l), (r) => right(r));
  }
}
