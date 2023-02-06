import 'package:dartz/dartz.dart';
import '../../../repositories/comment_repositories/delete_comment_repository.dart';
import 'delete_comment_usecase.dart';

class DeleteCommentUsecaseImplementation implements DeleteCommentUsecase {
  final DeleteCommentRepository repository;

  DeleteCommentUsecaseImplementation(this.repository);
  @override
  Future<Either<Exception, void>> call(String id) async {
    var response = await repository(id);
    return response.fold((l) => left(l), (r) => right(r));
  }
}
