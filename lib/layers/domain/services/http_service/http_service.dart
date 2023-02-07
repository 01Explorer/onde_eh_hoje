import 'package:dio/dio.dart';

abstract class HttpService {
  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters});

  Future<Response<T>> post<T>(String path,
      {required Map<String, dynamic> data});

  Future<Response<T>> put<T>(String path,
      {required Map<String, dynamic> data,
      required Map<String, dynamic> queryParameters});

  Future<Response<T>> delete<T>(String path,
      {Map<String, dynamic>? queryParameters});
}
