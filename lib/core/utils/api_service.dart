import 'package:dio/dio.dart';

class APIService {
  APIService(this._dio);

  final String _baseUrl = 'http://10.0.2.2:3020';
  final Map<String, dynamic> _headers = {
    'Content-Type': 'application/json; charset=utf-8',
  };

  final Dio _dio;

  Future<Map<String, dynamic>> get({
    required String path,
    Map<String, dynamic>? headers,
  }) async {
    Response response = await _dio.get(
      '$_baseUrl$path',
      options: Options(
        headers: headers,
      ),
    );
    return response.data;
  }

  Future<List<dynamic>>  getList({
    required String path,
    Map<String, dynamic>? headers,
  }) async {
    Response response = await _dio.get(
      '$_baseUrl$path',
      options: Options(
        headers: headers,
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    Map<String, dynamic>? headers,
    required String path,
    String? data,
  }) async {
    Response response = await _dio.post(
      '$_baseUrl$path',
      options: Options(
        headers: headers ?? _headers,
      ),
      data: data,
    );
    return response.data;
  }


  Future isValidToken({
    required Map<String, dynamic> headers,
    String? data,
  }) async {
    Response response = await _dio.post(
      '$_baseUrl/isValidToken',
      options: Options(
        headers: headers,
      ),
      data: data,
    );
    return response;
  }

  Future<Map<String, dynamic>> delete({
    Map<String, dynamic>? headers,
    required String path,
    String? data,
  }) async {
    Response response = await _dio.delete(
      '$_baseUrl$path',
      options: Options(
        headers: headers ?? _headers,
      ),
      data: data,
    );
    return response.data;
  }
}