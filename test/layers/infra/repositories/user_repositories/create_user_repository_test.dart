import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:onde_eh_hoje/layers/domain/entities/user_entity.dart';
import 'package:onde_eh_hoje/layers/domain/repositories/user_repositories/create_user_repository/create_user_repository.dart';
import 'package:onde_eh_hoje/layers/infra/datasources/remote/user_datasource/user_remote_datasource.dart';
import 'package:onde_eh_hoje/layers/infra/repositories/user_repositories/create_user_repository/create_user_repository_implementation.dart';
import '../../../../mocks/mocks.dart';

class MockUserRemoteDataSource extends Mock implements UserRemoteDataSource {}

void main() {
  late UserRemoteDataSource dataSource;
  late CreateUserRepository repository;
  setUp(() {
    dataSource = MockUserRemoteDataSource();
    repository = CreateUserRepositoryImplementation(dataSource);
    registerFallbackValue(mockedUser);
  });

  group('CreateUser Repo', () {
    test('If Sucessful should return an User value with id', () async {
      when(
        () => dataSource.signUpUser(any()),
      ).thenAnswer((_) async => right(mockedUser));

      var response = await repository(mockedUser.copyWith(id: null));
      response.fold((l) {
        expect(l, isNull);
      }, (r) {
        expect(r, isA<User>());
        expect(r.id, isNotNull);
      });
    });
    test('If fails should return an Exception', () async {
      when(
        () => dataSource.signUpUser(any()),
      ).thenAnswer((_) async => left(Exception('Failed to load data')));

      var response = await repository(mockedUser.copyWith(id: null));
      response.fold((l) {
        expect(l, isA<Exception>());
        expect(l.toString(), contains('Failed to load data'));
      }, (r) {
        expect(r, isNull);
      });
    });
  });
}

