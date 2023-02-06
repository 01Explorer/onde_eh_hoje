import 'package:dio/dio.dart';

abstract class HttpService {
  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters});

  Future<Response<T>> post<T>(String path, {Map<String, dynamic> data});

  Future<Response<T>> put<T>(String path,
      {Map<String, dynamic> data, Map<String, dynamic> queryParameters});

  Future<Response<T>> delete<T>(String path,
      {Map<String, dynamic>? queryParameters});
}
