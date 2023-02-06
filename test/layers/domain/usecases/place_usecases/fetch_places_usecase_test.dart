import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:onde_eh_hoje/layers/domain/entities/place_entity.dart';
import 'package:onde_eh_hoje/layers/domain/repositories/place_repositories/fetch_places_repository/fetch_place_repository.dart';
import 'package:onde_eh_hoje/layers/domain/usecases/place_usecases/fetch_places_usecase/fetch_places_usecase.dart';
import 'package:onde_eh_hoje/layers/domain/usecases/place_usecases/fetch_places_usecase/fetch_places_usecase_implementation.dart';
import '../../../../mocks/mocks.dart';

class MockFetchPlacesRepository extends Mock implements FetchPlacesRepository {}

void main() {
  late FetchPlacesUsecase usecase;
  late FetchPlacesRepository repository;
  setUp(() {
    repository = MockFetchPlacesRepository();
    usecase = FetchPlacesUsecaseImplementation(repository);
  });

  group('FetchAllPlaces', () {
    test('Should return right (List<Places>) if successful', () async {
      when(
        () => repository.fetchAllPlaces(),
      ).thenAnswer((_) async => right(List.filled(3, mockedPlace)));

      var response = await usecase.fetchAllPlaces();
      expect(response.isRight(), isTrue);
      response.fold((l) => expect(l, isNull), (r) {
        expect(r, isA<List<Place>>());
        expect(r[0], isA<Place>());
        expect(r.length, 3);
      });
    });
    test('Should return an Exception if fails', () async {
      when(
        () => repository.fetchAllPlaces(),
      ).thenAnswer((_) async => left(Exception('Failed to reach the server')));

      var response = await usecase.fetchAllPlaces();
      expect(response.isRight(), isFalse);
      response.fold((l) {
        expect(l, isA<Exception>());
        expect(l.toString(), contains('Failed to reach the server'));
      }, (r) {
        expect(r, isNull);
      });
    });
  });
  group('FetchPlaceById', () {
    test('Should return right, Place, if successful', () async {
      when(
        () => repository.fetchPlaceById(any()),
      ).thenAnswer((_) async => right(mockedPlace));

      var response =
          await usecase.fetchPlaceById('75d11f00-7ebe-4c8e-8fdd-6662db353d9c');
      expect(response.isRight(), isTrue);
      response.fold((l) => expect(l, isNull), (r) {
        expect(r, isA<Place>());
        expect(r.id, '75d11f00-7ebe-4c8e-8fdd-6662db353d9c');
      });
    });
    test('Should return an Exception if fails', () async {
      when(
        () => repository.fetchPlaceById(any()),
      ).thenAnswer((_) async => left(Exception('Failed to reach the server')));

      var response =
          await usecase.fetchPlaceById('75d11f00-7ebe-4c8e-8fdd-6662db353d9c');
      expect(response.isRight(), isFalse);
      response.fold((l) {
        expect(l, isA<Exception>());
        expect(l.toString(), contains('Failed to reach the server'));
      }, (r) {
        expect(r, isNull);
      });
    });
  });
}