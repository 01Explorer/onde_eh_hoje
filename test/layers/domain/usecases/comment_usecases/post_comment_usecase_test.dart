import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:onde_eh_hoje/layers/domain/entities/comment_entity.dart';
import 'package:onde_eh_hoje/layers/domain/repositories/comment_repositories/post_comment_repository.dart';
import 'package:onde_eh_hoje/layers/domain/usecases/comment_usecases/post_comment_usecase/post_comment_usecase.dart';
import 'package:onde_eh_hoje/layers/domain/usecases/comment_usecases/post_comment_usecase/post_comment_usecase_implementation.dart';

import '../../../../mocks/mocks.dart';

class MockPostCommentRepository extends Mock implements PostCommentRepository {}

void main() {
  late PostCommentRepository repository;
  late PostCommentUsecase usecase;
  setUp(() {
    repository = MockPostCommentRepository();
    usecase = PostCommentUsecaseImplementation(repository);
    registerFallbackValue(mockedComment);
  });

  group('PostComment', () {
    test('If the post is successful should return a comment', () async {
      when(
        () => repository(any()),
      ).thenAnswer((_) async => right(mockedComment));

      var response =
          await usecase(mockedUser, 'this is a test message', mockedPlace);
      expect(response.isRight(), isTrue);
      response.fold((l) {
        expect(l, isNull);
      }, (r) {
        expect(r, isA<Comment>());
      });
    });
    test('If the post fails should return an Exception', () async {
      when(
        () => repository(any()),
      ).thenAnswer((_) async => left(Exception('Failed to post')));

      var response =
          await usecase(mockedUser, 'this is a test message', mockedPlace);
      expect(response.isRight(), isFalse);
      response.fold((l) {
        expect(l, isA<Exception>());
        expect(l.toString(), contains('Failed to post'));
      }, (r) {
        expect(r, isNull);
      });
    });
  });
}




