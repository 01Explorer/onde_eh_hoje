import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:onde_eh_hoje/layers/domain/entities/user_entity.dart';
import 'package:onde_eh_hoje/layers/domain/repositories/user_repositories/get_user_repository/get_user_repository.dart';
import 'package:onde_eh_hoje/layers/infra/datasources/remote/user_datasource/user_remote_datasource.dart';
import 'package:onde_eh_hoje/layers/infra/repositories/user_repositories/get_user_repository/get_user_repository_implementation.dart';
import '../../../../mocks/mocks.dart';

class MockUserRemoteDataSource extends Mock implements UserRemoteDataSource {}

void main() {
  late UserRemoteDataSource dataSource;
  late GetUserRepository repository;
  setUp(() {
    dataSource = MockUserRemoteDataSource();
    repository = GetUserRepositoryImplementation(dataSource);
    registerFallbackValue(mockedUser);
  });

  group('GetUser Repo', () {
    group('getAllUsers', () {
      test('Should return a list with all signed up Users', () async {
        when(
          () => dataSource.getAllUsers(),
        ).thenAnswer((_) async => right(List.filled(3, mockedUser)));

        var result = await repository.getAllUsers();
        expect(result.isRight(), true);
        result.fold((l) => expect(l, isNull), (r) {
          expect(r, isA<List<User>>());
          expect(r.length, 3);
          expect(r[0], isA<User>());
        });
      });

      test('Should throw an exception if can\'t get the data', () async {
        when(
          () => dataSource.getAllUsers(),
        ).thenAnswer((_) async => left(Exception('Can\'t reach the data')));

        var result = await repository.getAllUsers();
        expect(result.isLeft(), true);
        result.fold((l) {
          expect(l, isA<Exception>());
          expect(l.toString(), contains('Can\'t reach the data'));
        }, (r) => expect(r, isNull));
      });
    });
  });
  group('GetUserById', () {
    test('should return right if a single User with matching ID was found',
        () async {
      when(
        () => dataSource.getUserById(any()),
      ).thenAnswer((_) async => right(mockedUser));

      var expectedResult =
          await repository.getUserById("75d11f00-7ebe-4c8e-8fdd-6662db353d9c");

      expect(expectedResult.isRight(), true);
      expectedResult.fold((l) => expect(l, isNull), (r) {
        expect(r, isA<User>());
        expect(r.id, "75d11f00-7ebe-4c8e-8fdd-6662db353d9c");
      });
    });

    test('If not found should return a String (Left)', () async {
      when(
        () => dataSource.getUserById(any()),
      ).thenAnswer((_) async => left(Exception('No users found')));

      var result = await repository.getUserById('aa');
      expect(result.isLeft(), true);
      result.fold((l) {
        expect(l, isA<Exception>());
        expect(l.toString(), contains('No users found'));
      }, (r) => expect(r, isNull));
    });
  });
}