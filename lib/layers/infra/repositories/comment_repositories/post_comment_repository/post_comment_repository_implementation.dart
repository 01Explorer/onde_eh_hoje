import 'package:dartz/dartz.dart';
import '../../../../domain/entities/comment_entity.dart';
import '../../../../domain/repositories/comment_repositories/post_comment_repository.dart';
import '../../../datasources/remote/comment_datasource/comment_remote_datasource.dart';

class PostCommentRepositoryImplementation implements PostCommentRepository {
  final CommentRemoteDataSource dataSource;

  PostCommentRepositoryImplementation(this.dataSource);
  @override
  Future<Either<Exception, Comment>> call(Comment comment) async {
    var response = await dataSource.postComment(comment);
    return response.fold((l) => left(l), (r) => right(r));
  }
}
