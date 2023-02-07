import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:onde_eh_hoje/layers/domain/services/http_service/http_service.dart';
import 'package:onde_eh_hoje/layers/infra/services/http_service/http_service_implementation.dart';
import '../../../mocks/mocks.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  const String urlTest = 'https://test-url/api';
  late HttpService httpService;
  setUp(() {
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = dioAdapter;
    httpService = HttpServiceImplementation(dio);
  });

  group('HttpService', () {
    group('GET', () {
      test('Should return a response if it was successful', () async {
        dioAdapter.onGet('$urlTest/get',
            (server) => server.reply(200, {'message': 'success'}));

        var response = await httpService.get('https://test-url/api/get');
        expect(response, isA<Response>());
        expect(response.statusCode, 200);
        expect(response.data, isNotEmpty);
      });
      test('Should return a Response with no statuscode if it fails', () async {
        dioAdapter.onGet('$urlTest/get',
            (server) => server.reply(400, {'message': 'error'}));

        var response = await httpService.get('https://test-url/api/get');
        expect(response, isA<Response>());
        expect(response.statusCode, isNull);
        expect(response.statusMessage, isNotNull);
      });
    });
    group('DELETE', () {
      test('Should return a response if it was successful', () async {
        dioAdapter.onDelete('$urlTest/delete',
            (server) => server.reply(200, {'message': 'success'}));

        var response = await httpService.delete('https://test-url/api/delete');
        expect(response, isA<Response>());
        expect(response.statusCode, 200);
        expect(response.data, isNotEmpty);
      });
      test('Should return a Response with no statuscode if it fails', () async {
        dioAdapter.onDelete('$urlTest/delete',
            (server) => server.reply(400, {'message': 'error'}));

        var response = await httpService.delete('https://test-url/api/delete');
        expect(response, isA<Response>());
        expect(response.statusCode, isNull);
        expect(response.statusMessage, isNotNull);
      });
    });
    group('POST', () {
      test('Should return a response if it was successful', () async {
        dioAdapter.onPost(
            '$urlTest/post',
            data: mockDataJson,
            (server) => server.reply(200, {'message': 'success'}));

        var response = await httpService.post('https://test-url/api/post',
            data: mockDataJson);
        expect(response, isA<Response>());
        expect(response.statusCode, 200);
        expect(response.data, isNotEmpty);
      });
      test('Should return a Response with no statuscode if it fails', () async {
        dioAdapter.onPost(
            '$urlTest/post',
            data: mockDataJson,
            (server) => server.reply(400, {'message': 'error'}));

        var response = await httpService.post('https://test-url/api/post',
            data: mockDataJson);
        expect(response, isA<Response>());
        expect(response.statusCode, isNull);
        expect(response.statusMessage, isNotNull);
      });
    });
    group('PUT', () {
      test('Should return a response if it was successful', () async {
        dioAdapter.onPut(
            '$urlTest/put',
            data: mockDataJson,
            queryParameters: {'id': '75d11f00-7ebe-4c8e-8fdd-6662db353d9c'},
            (server) => server.reply(200, {'message': 'success'}));

        var response = await httpService.put('https://test-url/api/put',
            data: mockDataJson,
            queryParameters: {'id': '75d11f00-7ebe-4c8e-8fdd-6662db353d9c'});
        expect(response, isA<Response>());
        expect(response.statusCode, 200);
        expect(response.data, isNotEmpty);
      });
      test('Should return a Response with no statuscode if it fails', () async {
        dioAdapter.onPut(
            '$urlTest/put',
            data: mockDataJson,
            queryParameters: {'id': '75d11f00-7ebe-4c8e-8fdd-6662db353d9c'},
            (server) => server.reply(400, {'message': 'error'}));

        var response = await httpService.put('https://test-url/api/put',
            data: mockDataJson,
            queryParameters: {'id': '75d11f00-7ebe-4c8e-8fdd-6662db353d9c'});
        expect(response, isA<Response>());
        expect(response.statusCode, isNull);
        expect(response.statusMessage, isNotNull);
      });
    });
  });
}