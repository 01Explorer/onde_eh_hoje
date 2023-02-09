import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:onde_eh_hoje/layers/domain/entities/place_entity.dart';
import 'package:onde_eh_hoje/layers/domain/services/http_service/http_service.dart';
import 'package:onde_eh_hoje/layers/domain/utils/utils.dart';
import 'package:onde_eh_hoje/layers/external/datasources/remote/place_datasource/place_remote_datasource_implementation.dart';
import 'package:onde_eh_hoje/layers/infra/datasources/remote/places_datasource/place_remote_datasource.dart';

import '../../../mocks/mocks.dart';

class MockHttpService extends Mock implements HttpService {}

void main() {
  late HttpService httpService;
  late PlaceRemoteDataSource dataSource;
  setUp(() {
    httpService = MockHttpService();
    dataSource = PlaceRemoteDataSourceImplementation(httpService);
  });

  group('PlaceDataSource', () {
    group('FetchAllPlace', () {
      test('Should return a list of Places if successful', () async {
        when(
          () => httpService.get(Utils.getPlaceApiEndpoint),
        ).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: Utils.getPlaceApiEndpoint),
            statusCode: 200,
            data: mockedListOfPlacesJson));

        var response = await dataSource.fetchAllPlaces();
        response.fold((l) {
          expect(l, isNull);
        }, (r) {
          expect(r, isA<List<Place>>());
          expect(r[0], isA<Place>());
          expect(r[0].id, isNotNull);
          expect(r[0].name, isNotNull);
          expect(r[0].latitude, isNotNull);
          expect(r[0].longitude, isNotNull);
        });
      });
      test('Should return an Exception if it fails', () async {
        when(
          () => httpService.get(Utils.getPlaceApiEndpoint),
        ).thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: Utils.getPlaceApiEndpoint),
            ));

        var response = await dataSource.fetchAllPlaces();
        response.fold((l) {
          expect(l, isA<Exception>());
          expect(l.toString(), contains('Failed'));
        }, (r) {
          expect(r, isNull);
        });
      });
    });
    group('FetchPlaceById', () {
      test('Should return a Place if successful', () async {
        when(
          () => httpService
              .get(Utils.getPlaceApiEndpoint, queryParameters: {'id': 'test'}),
        ).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: Utils.getPlaceApiEndpoint),
            statusCode: 200,
            data: mockedPlaceJson));

        var response = await dataSource.fetchPlaceById('test');
        response.fold((l) {
          expect(l, isNull);
        }, (r) {
          expect(r, isA<Place>());
          expect(r.id, isNotNull);
          expect(r.name, isNotNull);
          expect(r.latitude, isNotNull);
          expect(r.longitude, isNotNull);
        });
      });
      test('Should return an Exception if it fails', () async {
        when(
          () => httpService
              .get(Utils.getPlaceApiEndpoint, queryParameters: {'id': 'test'}),
        ).thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: Utils.getPlaceApiEndpoint),
            ));

        var response = await dataSource.fetchPlaceById('test');
        response.fold((l) {
          expect(l, isA<Exception>());
          expect(l.toString(), contains('Failed'));
        }, (r) {
          expect(r, isNull);
        });
      });
    });
    group('RegisterAPlace', () {
      test('Should return a Place if successful', () async {
        when(
          () => httpService.post(Utils.postPlaceApiEndpoint,
              data: mockedPlace.toJson()),
        ).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: Utils.postPlaceApiEndpoint),
            statusCode: 200,
            data: mockedPlaceJson));

        var response = await dataSource.registerPlace(mockedPlace);
        response.fold((l) {
          expect(l, isNull);
        }, (r) {
          expect(r, isA<Place>());
          expect(r.id, isNotNull);
          expect(r.name, isNotNull);
          expect(r.latitude, isNotNull);
          expect(r.longitude, isNotNull);
        });
      });
      test('Should return an Exception if it fails', () async {
        when(
          () => httpService.post(Utils.postPlaceApiEndpoint,
              data: mockedPlace.toJson()),
        ).thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: Utils.postPlaceApiEndpoint),
            ));

        var response = await dataSource.registerPlace(mockedPlace);
        response.fold((l) {
          expect(l, isA<Exception>());
          expect(l.toString(), contains('Failed'));
        }, (r) {
          expect(r, isNull);
        });
      });
    });
  });
}
