import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:onde_eh_hoje/layers/domain/entities/user_entity.dart';
import 'package:onde_eh_hoje/layers/domain/repositories/user_repositories/create_user_repository/create_user_repository.dart';
import 'package:onde_eh_hoje/layers/domain/usecases/user_usecases/create_user_usecase/create_user_usecase.dart';
import 'package:onde_eh_hoje/layers/domain/usecases/user_usecases/create_user_usecase/create_user_usecase_implementation.dart';
import '../../../../../mocks/mocks.dart';

class MockCreateUserRepository extends Mock implements CreateUserRepository {}

void main() {
  late CreateUserRepository repository;
  late CreateUserUsecase usecase;
  setUp(() {
    repository = MockCreateUserRepository();
    usecase = CreateUserUsecaseImplementation(repository);
    registerFallbackValue(mockedUser);
  });
  group('CreateUser', () {
    test('If successfull should return a User object', () async {
      when(
        () => repository(any()),
      ).thenAnswer((_) async => right(mockedUser));

      var response = await usecase('Gabriel', 'gabriel@gmail.com');
      expect(response.isRight(), true);
      response.fold((l) => expect(l, isNull), (r) {
        expect(r, isA<User>());
      });
    });

    test('If fails should throw an Exception', () async {
      when(
        () => repository(any()),
      ).thenAnswer(
          (_) async => left(Exception('Couldn\'t reach the information')));

      var response = await usecase('Gabriel', 'gabriel@gmail.com');
      expect(response.isLeft(), true);
      response.fold((l) {
        expect(l, isA<Exception>());
        expect(l.toString(), contains('Couldn\'t reach the information'));
      }, (r) => expect(r, isNull));
    });
  });
}
