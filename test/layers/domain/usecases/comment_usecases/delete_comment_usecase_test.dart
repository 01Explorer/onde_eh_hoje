import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:onde_eh_hoje/layers/domain/repositories/comment_repositories/delete_comment_repository.dart';
import 'package:onde_eh_hoje/layers/domain/usecases/comment_usecases/delete_comment_usecase/delete_comment_usecase.dart';
import 'package:onde_eh_hoje/layers/domain/usecases/comment_usecases/delete_comment_usecase/delete_comment_usecase_implementation.dart';

class MockDeleteCommentRepository extends Mock
    implements DeleteCommentRepository {}

void main() {
  late DeleteCommentRepository repository;
  late DeleteCommentUsecase usecase;
  setUp(() {
    repository = MockDeleteCommentRepository();
    usecase = DeleteCommentUsecaseImplementation(repository);
  });

  group('DeleteComment', () {
    test('If successful should return right', () async {
      when(
        () => repository(any()),
      ).thenAnswer((_) async => Future.value(right(null)));

      var response = await usecase('anyId');
      expect(response.isRight(), isTrue);
      response.fold((l) {
        expect(l, isNull);
      }, (r) => null);
    });
    test('If fails should return an Exception', () async {
      when(
        () => repository(any()),
      ).thenAnswer((_) async => left(Exception('Fail to delete')));

      var response = await usecase('anyId');
      expect(response.isRight(), isFalse);
      response.fold((l) {
        expect(l, isA<Exception>());
        expect(l.toString(), contains('Fail to delete'));
      }, (r) => null);
    });
  });
}
