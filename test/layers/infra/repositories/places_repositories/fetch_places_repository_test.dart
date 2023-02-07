import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:onde_eh_hoje/layers/domain/entities/place_entity.dart';
import 'package:onde_eh_hoje/layers/domain/repositories/place_repositories/fetch_places_repository/fetch_place_repository.dart';
import 'package:onde_eh_hoje/layers/infra/datasources/remote/places_datasource/place_remote_datasource.dart';
import 'package:onde_eh_hoje/layers/infra/repositories/place_repositories/fetch_places_repository/fetch_places_repository_implementation.dart';
import '../../../../mocks/mocks.dart';

class MockPlaceRemoteDataSource extends Mock implements PlaceRemoteDataSource {}

void main() {
  late PlaceRemoteDataSource dataSource;
  late FetchPlacesRepository repository;
  setUp(() {
    dataSource = MockPlaceRemoteDataSource();
    repository = FetchPlacesRepositoryImplementation(dataSource);
  });

  group('FetchPlaces Repo', () {
    group('FetchAllPlaces', () {
      test('Should return right (List<Places>) if successful', () async {
        when(
          () => dataSource.fetchAllPlaces(),
        ).thenAnswer((_) async => right(List.filled(3, mockedPlace)));

        var response = await repository.fetchAllPlaces();
        expect(response.isRight(), isTrue);
        response.fold((l) => expect(l, isNull), (r) {
          expect(r, isA<List<Place>>());
          expect(r[0], isA<Place>());
          expect(r.length, 3);
        });
      });
      test('Should return an Exception if fails', () async {
        when(
          () => dataSource.fetchAllPlaces(),
        ).thenAnswer(
            (_) async => left(Exception('Failed to reach the server')));

        var response = await repository.fetchAllPlaces();
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
          () => dataSource.fetchPlaceById(any()),
        ).thenAnswer((_) async => right(mockedPlace));

        var response = await repository
            .fetchPlaceById('75d11f00-7ebe-4c8e-8fdd-6662db353d9c');
        expect(response.isRight(), isTrue);
        response.fold((l) => expect(l, isNull), (r) {
          expect(r, isA<Place>());
          expect(r.id, '75d11f00-7ebe-4c8e-8fdd-6662db353d9c');
        });
      });
      test('Should return an Exception if fails', () async {
        when(
          () => dataSource.fetchPlaceById(any()),
        ).thenAnswer(
            (_) async => left(Exception('Failed to reach the server')));

        var response = await repository
            .fetchPlaceById('75d11f00-7ebe-4c8e-8fdd-6662db353d9c');
        expect(response.isRight(), isFalse);
        response.fold((l) {
          expect(l, isA<Exception>());
          expect(l.toString(), contains('Failed to reach the server'));
        }, (r) {
          expect(r, isNull);
        });
      });
    });
  });
}

