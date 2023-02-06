import 'package:dartz/dartz.dart';
import 'package:onde_eh_hoje/layers/domain/entities/comment_entity.dart';
import 'package:onde_eh_hoje/layers/domain/entities/place_entity.dart';
import '../../../entities/user_entity.dart';

abstract class PostCommentUsecase {
  Future<Either<Exception, Comment>> call(User user, String message, Place place);
}
