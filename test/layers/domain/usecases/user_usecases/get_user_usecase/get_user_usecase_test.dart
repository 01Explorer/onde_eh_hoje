import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:onde_eh_hoje/layers/domain/entities/user_entity.dart';
import 'package:onde_eh_hoje/layers/domain/repositories/user_repositories/get_user_repository/get_user_repository.dart';
import 'package:onde_eh_hoje/layers/domain/usecases/user_usecases/get_user_usecase/get_user_usecase.dart';
import 'package:onde_eh_hoje/layers/domain/usecases/user_usecases/get_user_usecase/get_user_usecase_implementation.dart';
import '../../../../../mocks/mocks.dart';

class MockGetUserRepository extends Mock implements GetUserRepository {}

void main() {
  late GetUserRepository repository;
  late GetUserUsecase usecase;

  setUp(
    () {
      repository = MockGetUserRepository();
      usecase = GetUserUsecaseImplementation(repository);
    },
  );
  group('GetUser Usecase', () {
    group('GetUserById', () {
      test('should return right if a single User with matching ID was found',
          () async {
        when(
          () => repository.getUserById(any()),
        ).thenAnswer((_) async => right(mockedUser));

        var expectedResult =
            await usecase.getUserById("75d11f00-7ebe-4c8e-8fdd-6662db353d9c");

        expect(expectedResult.isRight(), true);
        expectedResult.fold((l) => expect(l, isNull), (r) {
          expect(r, isA<User>());
          expect(r.id, "75d11f00-7ebe-4c8e-8fdd-6662db353d9c");
        });
      });

      test('If not found should return a String (Left)', () async {
        when(
          () => repository.getUserById(any()),
        ).thenAnswer((_) async => left(Exception('No users found')));

        var result = await usecase.getUserById('aa');
        expect(result.isLeft(), true);
        result.fold((l) {
          expect(l, isA<Exception>());
          expect(l.toString(), contains('No users found'));
        }, (r) => expect(r, isNull));
      });
    });

    group('GetAllUsers', () {
      test('Should return a list with all signed up Users', () async {
        when(
          () => repository.getAllUsers(),
        ).thenAnswer((_) async => right(List.filled(3, mockedUser)));

        var result = await usecase.getAllUsers();
        expect(result.isRight(), true);
        result.fold((l) => expect(l, isNull), (r) {
          expect(r, isA<List<User>>());
          expect(r.length, 3);
          expect(r[0], isA<User>());
        });
      });

      test('Should throw an exception if can\'t get the data', () async {
        when(
          () => repository.getAllUsers(),
        ).thenAnswer((_) async => left(Exception('Can\'t reach the data')));

        var result = await usecase.getAllUsers();
        expect(result.isLeft(), true);
        result.fold((l) {
          expect(l, isA<Exception>());
          expect(l.toString(), contains('Can\'t reach the data'));
        }, (r) => expect(r, isNull));
      });
    });
  });
}
