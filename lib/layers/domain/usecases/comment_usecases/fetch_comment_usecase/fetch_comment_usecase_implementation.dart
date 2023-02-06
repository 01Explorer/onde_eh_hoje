import 'package:dartz/dartz.dart';
import '../../../entities/comment_entity.dart';
import '../../../repositories/comment_repositories/fetch_comment_repository.dart';
import 'fetch_comment_usecase.dart';

class FetchCommentUsecaseImplementation implements FetchCommentUsecase {
  final FetchCommentRepository repository;

  FetchCommentUsecaseImplementation(this.repository);
  @override
  Future<Either<Exception, List<Comment>>> fetchAllComments() async {
    var response = await repository.fetchAllComments();
    return response.fold((l) => left(l), (r) => right(r));
  }

  @override
  Future<Either<Exception, Comment>> fetchCommentById(String id) async {
    var response = await repository.fetchCommentById(id);
    return response.fold((l) => left(l), (r) => right(r));
  }

  @override
  Future<Either<Exception, List<Comment>>> fetchCommentsByPlace(
      String id) async {
    var response = await repository.fetchCommentsByPlace(id);
    return response.fold((l) => left(l), (r) => right(r));
  }

  @override
  Future<Either<Exception, List<Comment>>> fetchCommentsByUser(
      String id) async {
    var response = await repository.fetchCommentsByUser(id);
    return response.fold((l) => left(l), (r) => right(r));
  }
}
