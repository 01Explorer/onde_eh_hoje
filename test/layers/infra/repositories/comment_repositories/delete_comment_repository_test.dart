import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:onde_eh_hoje/layers/domain/repositories/comment_repositories/delete_comment_repository.dart';
import 'package:onde_eh_hoje/layers/infra/datasources/remote/comment_datasource/comment_remote_datasource.dart';
import 'package:onde_eh_hoje/layers/infra/repositories/comment_repositories/delete_comment_repository/delete_comment_repository_implementation.dart';
import '../../../../mocks/mocks.dart';

class MockCommentRemoteDataSource extends Mock
    implements CommentRemoteDataSource {}

void main() {
  late CommentRemoteDataSource dataSource;
  late DeleteCommentRepository repository;
  setUp(() {
    dataSource = MockCommentRemoteDataSource();
    repository = DeleteCommentRepositoryImplementation(dataSource);
    registerFallbackValue(mockedPlace);
  });

  group('DeleteComment Repo', () {
    group('DeleteComment', () {
    test('If successful should return right', () async {
      when(
        () => dataSource.deleteComment(any()),
      ).thenAnswer((_) async => Future.value(right(null)));

      var response = await repository('anyId');
      expect(response.isRight(), isTrue);
      response.fold((l) {
        expect(l, isNull);
      }, (r) => null);
    });
    test('If fails should return an Exception', () async {
      when(
        () => dataSource.deleteComment(any()),
      ).thenAnswer((_) async => left(Exception('Fail to delete')));

      var response = await repository('anyId');
      expect(response.isRight(), isFalse);
      response.fold((l) {
        expect(l, isA<Exception>());
        expect(l.toString(), contains('Fail to delete'));
      }, (r) => null);
    });
  });
  });
}