import 'package:dio/dio.dart';
import 'package:git_friend/shared/models/git_user_model.dart';
import 'package:git_friend/infrastructure/repositores/api_github__repository.dart';

class ApiGitHubRepositoryImpl implements ApiGitHubRepository {
  final Dio _dio;

  ApiGitHubRepositoryImpl(this._dio);

  @override
  Future<GitUserModel?> getRepos(String username) async {
    return null;
  }

  @override
  Future getUser(String username) async {
    try {
      final response = await _dio.get('https://api.github.com/users/$username');
      return response.data;
    } catch (e) {
      throw Exception('Requests for $username failed. Error => $e');
    }
  }
}
