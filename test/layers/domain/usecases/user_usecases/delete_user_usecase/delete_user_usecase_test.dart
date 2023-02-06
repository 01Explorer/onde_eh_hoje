import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:onde_eh_hoje/layers/domain/repositories/user_repositories/delete_user_repository/delete_user_repository.dart';
import 'package:onde_eh_hoje/layers/domain/usecases/user_usecases/delete_user_usecasee/delete_user_usecase.dart';
import 'package:onde_eh_hoje/layers/domain/usecases/user_usecases/delete_user_usecasee/delete_user_usecase_implementation.dart';

class MockDeleteUserRepository extends Mock implements DeleteUserRepository {}

void main() {
  late DeleteUserRepository repository;
  late DeleteUserUsecase usecase;
  setUp(() {
    repository = MockDeleteUserRepository();
    usecase = DeleteUserUsecaseImplementation(repository);
  });
  group('DeleteUser', () {
    test('If successful should return true', () async {
      when(
        () => repository(any()),
      ).thenAnswer((_) async => right(true));

      var response = await usecase('asa');
      expect(response.isRight(), true);
      response.fold((l) => expect(l, isNull), (r) {
        expect(r, isA<bool>());
        expect(r, isTrue);
      });
    });

    test('If fails should throw an Exception', () async {
      when(
        () => repository(any()),
      ).thenAnswer(
          (_) async => left(Exception('Couldn\'t reach any information')));

      var response = await usecase('asa');
      expect(response.isRight(), false);
      response.fold((l) {
        expect(l, isA<Exception>());
        expect(l.toString(), contains('Couldn\'t reach any information'));
      }, (r) {
        expect(r, isFalse);
      });
    });
  });
}