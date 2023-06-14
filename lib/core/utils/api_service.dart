import 'package:dio/dio.dart';

class APIService {
  APIService(this._dio);

  final String _baseUrl = 'http://10.0.2.2:6969';
  final Map<String, dynamic> _headers = {
    'Content-Type': 'application/json; charset=utf-8',
  };

  final Dio _dio;

  Future<Map<String, dynamic>> get({required String path}) async {
    Response response = await _dio.get(
      '$_baseUrl$path',
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String path,
    required String data,
  }) async {
    Response response = await _dio.post(
      '$_baseUrl$path',
      options: Options(
        headers: _headers,
      ),
      data: data,
    );
    return response.data;
  }
}