import 'package:dartz/dartz.dart';
import 'package:onde_eh_hoje/layers/domain/usecases/comment_usecases/post_comment_usecase/post_comment_usecase.dart';
import '../../../entities/comment_entity.dart';
import '../../../entities/place_entity.dart';
import '../../../entities/user_entity.dart';
import '../../../repositories/comment_repositories/post_comment_repository.dart';

class PostCommentUsecaseImplementation implements PostCommentUsecase {
  final PostCommentRepository repository;

  PostCommentUsecaseImplementation(this.repository);
  @override
  Future<Either<Exception, Comment>> call(
      User user, String message, Place place) async {
    var response = await repository
        .call(Comment(user: user, message: message, place: place));
    return response.fold((l) => left(l), (r) => right(r));
  }
}
