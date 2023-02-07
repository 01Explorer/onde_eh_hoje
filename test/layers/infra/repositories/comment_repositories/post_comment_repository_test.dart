import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:onde_eh_hoje/layers/domain/entities/comment_entity.dart';
import 'package:onde_eh_hoje/layers/domain/repositories/comment_repositories/post_comment_repository.dart';
import 'package:onde_eh_hoje/layers/infra/datasources/remote/comment_datasource/comment_remote_datasource.dart';
import 'package:onde_eh_hoje/layers/infra/repositories/comment_repositories/post_comment_repository/post_comment_repository_implementation.dart';
import '../../../../mocks/mocks.dart';

class MockCommentRemoteDataSource extends Mock
    implements CommentRemoteDataSource {}

void main() {
  late CommentRemoteDataSource dataSource;
  late PostCommentRepository repository;
  setUp(() {
    dataSource = MockCommentRemoteDataSource();
    repository = PostCommentRepositoryImplementation(dataSource);
    registerFallbackValue(mockedComment);
  });

  group('PostComment Repo', () {
    group('PostComment', () {
    test('If the post is successful should return a comment', () async {
      when(
        () => dataSource.postComment(any()),
      ).thenAnswer((_) async => right(mockedComment));

      var response =
          await repository(mockedComment);
      expect(response.isRight(), isTrue);
      response.fold((l) {
        expect(l, isNull);
      }, (r) {
        expect(r, isA<Comment>());
      });
    });
    test('If the post fails should return an Exception', () async {
      when(
        () => dataSource.postComment(any()),
      ).thenAnswer((_) async => left(Exception('Failed to post')));

      var response =
          await repository(mockedComment);
      expect(response.isRight(), isFalse);
      response.fold((l) {
        expect(l, isA<Exception>());
        expect(l.toString(), contains('Failed to post'));
      }, (r) {
        expect(r, isNull);
      });
    });
  });
  });
}

