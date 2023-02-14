import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:onde_eh_hoje/layers/domain/entities/place_entity.dart';
import 'package:onde_eh_hoje/layers/domain/repositories/place_repositories/edit_place_repository/edit_place_repository.dart';
import 'package:onde_eh_hoje/layers/domain/usecases/place_usecases/edit_place_usecase/edit_place_usecase.dart';
import 'package:onde_eh_hoje/layers/domain/usecases/place_usecases/edit_place_usecase/edit_place_usecase_implementation.dart';
import '../../../../mocks/mocks.dart';

class MockEditPlaceRepository extends Mock implements EditPlaceRepository {}

void main() {
  late EditPlaceRepository repository;
  late EditPlaceUsecase usecase;
  setUp(() {
    repository = MockEditPlaceRepository();
    usecase = EditPlaceUsecaseImplementation(repository);
    registerFallbackValue(mockedPlace);
  });

  group('EditPlace', () {
    test('If successful should return the edited place', () async {
      when(
        () => repository(any()),
      ).thenAnswer((_) async => right(
          mockedPlace.copyWith(name: 'Spirit', latitude: 2, longitude: 4)));

      var response =
          await usecase(mockedPlace, name: 'Spirit', latitude: 2, longitude: 4);

      response.fold((l) {
        expect(l, isNull);
      }, (r) {
        expect(r, isA<Place>());
        expect(r.name, 'Spirit');
        expect(r.latitude, 2);
        expect(r.longitude, 4);
      });
    });
    test('If fails should return an exception', () async {
      when(
        () => repository(any()),
      ).thenAnswer((_) async => left(Exception('Failed to edit')));

      var response =
          await usecase(mockedPlace, name: 'Spirit', latitude: 2, longitude: 4);

      response.fold((l) {
        expect(l, isA<Exception>());
        expect(l.toString(), contains('Failed'));
      }, (r) {
        expect(r, isNull);
      });
    });
  });
}



