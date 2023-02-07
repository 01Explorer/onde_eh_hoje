import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:onde_eh_hoje/layers/domain/entities/comment_entity.dart';
import 'package:onde_eh_hoje/layers/domain/repositories/comment_repositories/fetch_comment_repository.dart';
import 'package:onde_eh_hoje/layers/infra/datasources/remote/comment_datasource/comment_remote_datasource.dart';
import 'package:onde_eh_hoje/layers/infra/repositories/comment_repositories/fetch_comment_repository/fetch_comment_repository_implementation.dart';
import '../../../../mocks/mocks.dart';

class MockCommentRemoteDataSource extends Mock
    implements CommentRemoteDataSource {}

void main() {
  late CommentRemoteDataSource dataSource;
  late FetchCommentRepository repository;
  setUp(() {
    dataSource = MockCommentRemoteDataSource();
    repository = FetchCommentRepositoryImplementation(dataSource);
  });

  group('FetchComment Repo', () {
    group('FetchAllComments', () {
      test('If successful should return a list of Comments', () async {
        when(
          () => dataSource.fetchAllComments(),
        ).thenAnswer((_) async => right(List.filled(3, mockedComment)));

        var response = await repository.fetchAllComments();
        expect(response.isRight(), isTrue);
        response.fold((l) {
          expect(l, isNull);
        }, (r) {
          expect(r, isA<List<Comment>>());
          expect(r[0], isA<Comment>());
        });
      });
      test('If fails should return an Exception', () async {
        when(
          () => dataSource.fetchAllComments(),
        ).thenAnswer(
            (_) async => left(Exception('Failed to reach connection')));

        var response = await repository.fetchAllComments();
        expect(response.isRight(), isFalse);
        response.fold((l) {
          expect(l, isA<Exception>());
          expect(l.toString(), contains('Failed to reach connection'));
        }, (r) {
          expect(r, isNull);
        });
      });
    });
    group('FetchCommentByPlace', () {
      test('If successful should return a list of Comments', () async {
        when(
          () => dataSource.fetchCommentsByPlace(any()),
        ).thenAnswer((_) async => right(List.filled(3, mockedComment)));

        var response = await repository.fetchCommentsByPlace('aaaaaaaaaa');
        expect(response.isRight(), isTrue);
        response.fold((l) {
          expect(l, isNull);
        }, (r) {
          expect(r, isA<List<Comment>>());
          expect(r[0], isA<Comment>());
        });
      });
      test('If fails should return an Exception', () async {
        when(
          () => dataSource.fetchCommentsByPlace(any()),
        ).thenAnswer(
            (_) async => left(Exception('Failed to reach connection')));

        var response = await repository.fetchCommentsByPlace('aaaaaaaaa');
        expect(response.isRight(), isFalse);
        response.fold((l) {
          expect(l, isA<Exception>());
          expect(l.toString(), contains('Failed to reach connection'));
        }, (r) {
          expect(r, isNull);
        });
      });
    });
    group('FetchCommentByUser', () {
      test('If successful should return a list of Comments', () async {
        when(
          () => dataSource.fetchCommentsByUser(any()),
        ).thenAnswer((_) async => right(List.filled(3, mockedComment)));

        var response = await repository.fetchCommentsByUser('aaaaaaaaaa');
        expect(response.isRight(), isTrue);
        response.fold((l) {
          expect(l, isNull);
        }, (r) {
          expect(r, isA<List<Comment>>());
          expect(r[0], isA<Comment>());
        });
      });
      test('If fails should return an Exception', () async {
        when(
          () => dataSource.fetchCommentsByUser(any()),
        ).thenAnswer(
            (_) async => left(Exception('Failed to reach connection')));

        var response = await repository.fetchCommentsByUser('aaaaaaaaa');
        expect(response.isRight(), isFalse);
        response.fold((l) {
          expect(l, isA<Exception>());
          expect(l.toString(), contains('Failed to reach connection'));
        }, (r) {
          expect(r, isNull);
        });
      });
    });
    group('FetchCommentById', () {
      test('If successful should return a single Comment', () async {
        when(
          () => dataSource.fetchCommentById(any()),
        ).thenAnswer((_) async => right(mockedComment));

        var response = await repository
            .fetchCommentById('75d11f00-7ebe-4c8e-8fdd-6662db353d9c');
        expect(response.isRight(), isTrue);
        response.fold((l) {
          expect(l, isNull);
        }, (r) {
          expect(r, isA<Comment>());
          expect(r.id, '75d11f00-7ebe-4c8e-8fdd-6662db353d9c');
        });
      });
      test('If fails should return an Exception', () async {
        when(
          () => dataSource.fetchCommentsByUser(any()),
        ).thenAnswer(
            (_) async => left(Exception('Failed to reach connection')));

        var response = await repository.fetchCommentsByUser('aaaaaaaaa');
        expect(response.isRight(), isFalse);
        response.fold((l) {
          expect(l, isA<Exception>());
          expect(l.toString(), contains('Failed to reach connection'));
        }, (r) {
          expect(r, isNull);
        });
      });
    });
  });
}
