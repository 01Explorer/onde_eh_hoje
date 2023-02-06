import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:onde_eh_hoje/layers/domain/entities/comment_entity.dart';
import 'package:onde_eh_hoje/layers/domain/repositories/comment_repositories/fetch_comment_repository.dart';
import 'package:onde_eh_hoje/layers/domain/usecases/comment_usecases/fetch_comment_usecase/fetch_comment_usecase.dart';
import 'package:onde_eh_hoje/layers/domain/usecases/comment_usecases/fetch_comment_usecase/fetch_comment_usecase_implementation.dart';
import '../../../../mocks/mocks.dart';

class MockFetchCommentRepository extends Mock
    implements FetchCommentRepository {}

void main() {
  late FetchCommentRepository repository;
  late FetchCommentUsecase usecase;
  setUp(() {
    repository = MockFetchCommentRepository();
    usecase = FetchCommentUsecaseImplementation(repository);
  });

  group('FetchAllComments', () {
    test('If successful should return a list of Comments', () async {
      when(
        () => repository.fetchAllComments(),
      ).thenAnswer((_) async => right(List.filled(3, mockedComment)));

      var response = await usecase.fetchAllComments();
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
        () => repository.fetchAllComments(),
      ).thenAnswer((_) async => left(Exception('Failed to reach connection')));

      var response = await usecase.fetchAllComments();
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
        () => repository.fetchCommentsByPlace(any()),
      ).thenAnswer((_) async => right(List.filled(3, mockedComment)));

      var response = await usecase.fetchCommentsByPlace('aaaaaaaaaa');
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
        () => repository.fetchCommentsByPlace(any()),
      ).thenAnswer((_) async => left(Exception('Failed to reach connection')));

      var response = await usecase.fetchCommentsByPlace('aaaaaaaaa');
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
        () => repository.fetchCommentsByUser(any()),
      ).thenAnswer((_) async => right(List.filled(3, mockedComment)));

      var response = await usecase.fetchCommentsByUser('aaaaaaaaaa');
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
        () => repository.fetchCommentsByUser(any()),
      ).thenAnswer((_) async => left(Exception('Failed to reach connection')));

      var response = await usecase.fetchCommentsByUser('aaaaaaaaa');
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
        () => repository.fetchCommentById(any()),
      ).thenAnswer((_) async => right(mockedComment));

      var response = await usecase
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
        () => repository.fetchCommentsByUser(any()),
      ).thenAnswer((_) async => left(Exception('Failed to reach connection')));

      var response = await usecase.fetchCommentsByUser('aaaaaaaaa');
      expect(response.isRight(), isFalse);
      response.fold((l) {
        expect(l, isA<Exception>());
        expect(l.toString(), contains('Failed to reach connection'));
      }, (r) {
        expect(r, isNull);
      });
    });
  });
}