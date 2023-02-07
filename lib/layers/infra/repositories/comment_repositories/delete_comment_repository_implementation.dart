import 'package:dartz/dartz.dart';
import '../../../domain/repositories/comment_repositories/delete_comment_repository.dart';
import '../../datasources/remote/comment_datasource/comment_remote_datasource.dart';

class DeleteCommentRepositoryImplementation implements DeleteCommentRepository {
  final CommentRemoteDataSource dataSource;

  DeleteCommentRepositoryImplementation(this.dataSource);
  @override
  Future<Either<Exception, void>> call(String id) async {
    var response = await dataSource.deleteComment(id);
    return response.fold((l) => left(l), (r) => right(r));
  }
}
