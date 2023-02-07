import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:onde_eh_hoje/layers/domain/entities/user_entity.dart';
import 'package:onde_eh_hoje/layers/domain/repositories/user_repositories/edit_user_repository/edit_user_repository.dart';
import 'package:onde_eh_hoje/layers/infra/datasources/remote/user_datasource/user_remote_datasource.dart';
import 'package:onde_eh_hoje/layers/infra/repositories/user_repositories/edit_user_repository/edit_user_repository_implementation.dart';
import '../../../../mocks/mocks.dart';

class MockUserRemoteDataSource extends Mock implements UserRemoteDataSource {}

void main() {
  late UserRemoteDataSource dataSource;
  late EditUserRepository repository;
  setUp(() {
    dataSource = MockUserRemoteDataSource();
    repository = EditUserRepositoryImplementation(dataSource);
  });

  group('EditUser Repo', () {
    test('should return an User if it was successfully edited', () async {
      when(
        () => dataSource.edit(any(), any()),
      ).thenAnswer((_) async => right(mockedUser.copyWith(name: 'Henrique')));

      var response = await repository('dsajkha', 'ashjjakf');

      expect(response.isRight(), isTrue);
      response.fold((l) => expect(l, isNull), (r) {
        expect(r, isA<User>());
        expect(r.name, 'Henrique');
      });
    });

    test('should return an Exception if it fails to edit', () async {
      when(
        () => dataSource.edit(any(), any()),
      ).thenAnswer((_) async => left(Exception('Failed to edit')));

      var response = await repository('dsajkha', 'ashjjakf');

      expect(response.isRight(), isFalse);
      response.fold((l) {
        expect(l, isA<Exception>());
        expect(l.toString(), contains('Failed to edit'));
      }, (r) {
        expect(r, isNull);
      });
    });
  });
}

