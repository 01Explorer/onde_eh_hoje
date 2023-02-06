import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:onde_eh_hoje/layers/domain/repositories/user_repositories/delete_user_repository/delete_user_repository.dart';
import 'package:onde_eh_hoje/layers/infra/datasources/remote/user_datasource/user_remote_datasource.dart';
import 'package:onde_eh_hoje/layers/infra/repositories/user_repositories/delete_user_repository/delete_user_repository_implementation.dart';

class MockUserRemoteDataSource extends Mock implements UserRemoteDataSource {}

void main() {
  late UserRemoteDataSource dataSource;
  late DeleteUserRepository repository;
  setUp(() {
    dataSource = MockUserRemoteDataSource();
    repository = DeleteUserRepositoryImplementation(dataSource);
  });

  group('DeleteUser Repo', () {
    test('If successful should return true', () async {
      when(
        () => dataSource.delete(any()),
      ).thenAnswer((_) async => right(true));

      var response = await repository('asa');
      expect(response.isRight(), true);
      response.fold((l) => expect(l, isNull), (r) {
        expect(r, isA<bool>());
        expect(r, isTrue);
      });
    });

    test('If fails should throw an Exception', () async {
      when(
        () => dataSource.delete(any()),
      ).thenAnswer(
          (_) async => left(Exception('Couldn\'t reach any information')));

      var response = await repository('asa');
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

