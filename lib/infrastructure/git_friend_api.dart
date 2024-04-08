import 'package:dio/dio.dart';

class GitFriendsApi {
  final Map<String, dynamic> _headers = {'content-type': 'application/json'};
  Dio _dio = Dio();

  GitFriendsApi() {
    _dio =
        Dio(BaseOptions(baseUrl: 'https://api.github.com', headers: _headers));
    // add intrceptos aqui
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
