import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:onde_eh_hoje/layers/domain/entities/place_entity.dart';
import 'package:onde_eh_hoje/layers/domain/repositories/place_repositories/register_place_repository/register_place_repository.dart';
import 'package:onde_eh_hoje/layers/infra/datasources/remote/places_datasource/place_remote_datasource.dart';
import 'package:onde_eh_hoje/layers/infra/repositories/place_repositories/register_place_repository/register_place_repository_implementation.dart';
import '../../../../mocks/mocks.dart';

class MockPlaceRemoteDataSource extends Mock implements PlaceRemoteDataSource {}

void main() {
  late PlaceRemoteDataSource dataSource;
  late RegisterPlaceRepository repository;
  setUp(() {
    dataSource = MockPlaceRemoteDataSource();
    repository = RegisterPlaceRepositoryImplementation(dataSource);
    registerFallbackValue(mockedPlace);
  });

  group('RegisterPlace Repo', () {
    group('RegisterPlace', () {
      test('If successful should return a valid place', () async {
        when(
          () => dataSource.registerPlace(any()),
        ).thenAnswer((_) async => right(
              mockedPlace.copyWith(name: 'Legend', latitude: 2, longitude: 3),
            ));
        var response = await repository(mockedPlace);
        expect(response.isRight(), isTrue);
        response.fold((l) => expect(l, isNull), (r) {
          expect(r, isA<Place>());
          expect(r.name, 'Legend');
          expect(r.latitude, 2);
          expect(r.longitude, 3);
        });
      });
      test('If fails should return an Exception', () async {
        when(
          () => dataSource.registerPlace(any()),
        ).thenAnswer(
            (_) async => left(Exception('Couldn\'t register a new place')));
        var response = await repository(mockedPlace);
        expect(response.isRight(), isFalse);
        response.fold((l) {
          expect(l, isA<Exception>());
          expect(l.toString(), contains('Couldn\'t register a new place'));
        }, (r) {
          expect(r, isNull);
        });
      });
    });
  });
}
