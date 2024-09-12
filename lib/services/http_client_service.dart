import 'package:dio/dio.dart';

class HttpClientService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> get(String path, Map<String, dynamic> params) async {
    final response = await _dio.get(path, queryParameters: params);
    return response.data;
  }
}
