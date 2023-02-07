import 'package:dio/dio.dart';

import '../../../domain/services/http_service/http_service.dart';

class HttpServiceImplementation implements HttpService {
  final Dio dio;

  HttpServiceImplementation(this.dio);
  @override
  Future<Response<T>> delete<T>(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      var response = await dio.delete(path, queryParameters: queryParameters);
      return Response(
          requestOptions: response.requestOptions,
          statusCode: response.statusCode,
          data: response.data);
    } on DioError catch (e) {
      return Response(
        requestOptions: RequestOptions(path: path),
        statusMessage: e.message,
      );
    }
  }

  @override
  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      var response = await dio.get(path, queryParameters: queryParameters);
      return Response(
          requestOptions: response.requestOptions,
          statusCode: response.statusCode,
          data: response.data);
    } on DioError catch (e) {
      return Response(
        requestOptions: RequestOptions(path: path),
        statusMessage: e.message,
      );
    }
  }

  @override
  Future<Response<T>> post<T>(String path,
      {required Map<String, dynamic> data}) async {
    try {
      var response = await dio.post(path, data: data);
      return Response(
          requestOptions: response.requestOptions,
          statusCode: response.statusCode,
          data: response.data);
    } on DioError catch (e) {
      return Response(
        requestOptions: RequestOptions(path: path),
        statusMessage: e.message,
      );
    }
  }

  @override
  Future<Response<T>> put<T>(String path,
      {required Map<String, dynamic> data,
      required Map<String, dynamic> queryParameters}) async {
    try {
      var response =
          await dio.put(path, queryParameters: queryParameters, data: data);
      return Response(
          requestOptions: response.requestOptions,
          statusCode: response.statusCode,
          data: response.data);
    } on DioError catch (e) {
      return Response(
        requestOptions: RequestOptions(path: path),
        statusMessage: e.message,
      );
    }
  }
}
