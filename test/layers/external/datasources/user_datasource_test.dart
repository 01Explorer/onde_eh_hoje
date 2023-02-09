import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:onde_eh_hoje/layers/external/datasources/remote/user_datasource/user_remote_datasource_implementation.dart';
import 'package:onde_eh_hoje/layers/domain/entities/user_entity.dart';
import 'package:onde_eh_hoje/layers/domain/services/http_service/http_service.dart';
import 'package:onde_eh_hoje/layers/domain/utils/utils.dart';
import 'package:onde_eh_hoje/layers/infra/datasources/remote/user_datasource/user_remote_datasource.dart';
import '../../../mocks/mocks.dart';

class MockHttpService extends Mock implements HttpService {}

void main() {
  late HttpService httpService;
  late UserRemoteDataSource dataSource;
  setUp(() {
    httpService = MockHttpService();
    dataSource = UserRemoteDataSourceImplementation(httpService);
  });

  group('UserDataSource', () {
    group('Delete', () {
      test('If successful should return true', () async {
        when(
          () => httpService.delete(Utils.deleteUserApiEndpoint,
              queryParameters: {'id': 'test'}),
        ).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: Utils.deleteUserApiEndpoint),
            statusCode: 200));

        var response = await dataSource.delete('test');
        response.fold((l) {
          expect(l, isNull);
        }, (r) {
          expect(r, isA<bool>());
          expect(r, isTrue);
        });
      });
      test('If fails should return an Exception', () async {
        when(
          () => httpService.delete(Utils.deleteUserApiEndpoint,
              queryParameters: {'id': 'test'}),
        ).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: Utils.deleteUserApiEndpoint)));

        var response = await dataSource.delete('test');
        response.fold((l) {
          expect(l, isA<Exception>());
          expect(l.toString(), contains('Failed'));
        }, (r) {
          expect(r, isNull);
        });
      });
    });
    group('Edit', () {
      test('If successful should return an User', () async {
        when(
          () => httpService.put(Utils.putUserApiEndpoint,
              queryParameters: {'id': 'test'}, data: {'name': 'gabriel'}),
        ).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: Utils.putUserApiEndpoint),
            statusCode: 200,
            data: mockUserJson));

        var response = await dataSource.edit('test', 'gabriel');
        response.fold((l) {
          expect(l, isNull);
        }, (r) {
          expect(r, isA<User>());
          expect(r.id, isNotNull);
        });
      });
      test('If fails should return an Exception', () async {
        when(
          () => httpService.put(Utils.putUserApiEndpoint,
              queryParameters: {'id': 'test'}, data: {'name': 'gabriel'}),
        ).thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: Utils.putUserApiEndpoint),
            ));

        var response = await dataSource.edit('test', 'gabriel');
        response.fold((l) {
          expect(l, isA<Exception>());
          expect(l.toString(), contains('Failed'));
        }, (r) {
          expect(r, isNull);
        });
      });
    });
    group('GetAllUsers', () {
      test('If successful should return a List of User', () async {
        when(
          () => httpService.get(Utils.getUserApiEndpoint),
        ).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: Utils.getUserApiEndpoint),
            statusCode: 200,
            data: mockedListofUsersJson));

        var response = await dataSource.getAllUsers();
        response.fold((l) {
          expect(l, isNull);
        }, (r) {
          expect(r, isA<List<User>>());
          expect(r[0], isA<User>());
        });
      });
      test('If fails should return an Exception', () async {
        when(
          () => httpService.get(Utils.getUserApiEndpoint),
        ).thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: Utils.getUserApiEndpoint),
            ));

        var response = await dataSource.getAllUsers();
        response.fold((l) {
          expect(l, isA<Exception>());
          expect(l.toString(), contains('Failed'));
        }, (r) {
          expect(r, isNull);
        });
      });
    });
    group('GetUserById', () {
      test('If successful should return an User', () async {
        when(
          () => httpService
              .get(Utils.getUserApiEndpoint, queryParameters: {'id': 'test'}),
        ).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: Utils.getUserApiEndpoint),
            statusCode: 200,
            data: mockUserJson));

        var response = await dataSource.getUserById('test');
        response.fold((l) {
          expect(l, isNull);
        }, (r) {
          expect(r, isA<User>());
        });
      });
      test('If fails should return an Exception', () async {
        when(
          () => httpService
              .get(Utils.getUserApiEndpoint, queryParameters: {'id': 'test'}),
        ).thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: Utils.getUserApiEndpoint),
            ));

        var response = await dataSource.getUserById('test');
        response.fold((l) {
          expect(l, isA<Exception>());
          expect(l.toString(), contains('Failed'));
        }, (r) {
          expect(r, isNull);
        });
      });
    });
    group('SignUp User', () {
      test('If successful should return an User', () async {
        when(
          () => httpService.post(Utils.postUserApiEndpoint,
              data: mockedUser.toJson(mockedUser)),
        ).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: Utils.getUserApiEndpoint),
            statusCode: 200,
            data: mockedUser));

        var response = await dataSource.signUpUser(mockedUser);
        response.fold((l) {
          expect(l, isNull);
        }, (r) {
          expect(r, isA<User>());
        });
      });
      test('If fails should return an Exception', () async {
        when(
          () => httpService.post(Utils.postUserApiEndpoint,
              data: mockedUser.toJson(mockedUser)),
        ).thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: Utils.getUserApiEndpoint),
            ));

        var response = await dataSource.signUpUser(mockedUser);
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
