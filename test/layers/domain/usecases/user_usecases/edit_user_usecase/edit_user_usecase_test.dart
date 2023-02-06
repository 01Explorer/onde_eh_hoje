import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:onde_eh_hoje/layers/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:onde_eh_hoje/layers/domain/repositories/user_repositories/edit_user_repository/edit_user_repository.dart';
import 'package:onde_eh_hoje/layers/domain/usecases/user_usecases/edit_user_usecase/edit_user_usecase.dart';
import 'package:onde_eh_hoje/layers/domain/usecases/user_usecases/edit_user_usecase/edit_user_usecase_implementation.dart';

import '../../../../../mocks/mocks.dart';

class MockEditUserRepository extends Mock implements EditUserRepository {}

void main() {
  late EditUserRepository repository;
  late EditUserUsecase usecase;

  setUp(
    () {
      repository = MockEditUserRepository();
      usecase = EditUserUsecaseImplementation(repository);
    },
  );

  group('EditUser', () {
    test('should return an User if it was successfully edited', () async {
      when(
        () => repository(any(), any()),
      ).thenAnswer((_) async => right(mockedUser.copyWith(name: 'Henrique')));

      var response = await usecase('dsajkha', 'ashjjakf');

      expect(response.isRight(), isTrue);
      response.fold((l) => expect(l, isNull), (r) {
        expect(r, isA<User>());
        expect(r.name, 'Henrique');
      });
    });

    test('should return an Exception if it fails to edit', () async {
      when(
        () => repository(any(), any()),
      ).thenAnswer((_) async => left(Exception('Failed to edit')));

      var response = await usecase('dsajkha', 'ashjjakf');

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



