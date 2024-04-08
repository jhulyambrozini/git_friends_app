import 'package:git_friend/infrastructure/git_friend_api.dart';
import 'package:git_friend/shared/models/git_user_model.dart';
import 'package:git_friend/infrastructure/repositores/api_github_repository.dart';
import 'package:git_friend/shared/models/git_user_repos_model.dart';

class ApiGitHubRepositoryImpl implements ApiGitHubRepository {
  final GitFriendsApi _dio;

  ApiGitHubRepositoryImpl(this._dio);

  @override
  Future<List<GitUserReposModel>> getRepos(String username) async {
    try {
      final response = await _dio.get('/users/$username/repos');

      final List<dynamic> responseData = response.data;
      final List<GitUserReposModel> data = responseData
          .map((repo) =>
              GitUserReposModel.fromJson(repo as Map<String, dynamic>))
          .toList();

      return data;
    } catch (e) {
      throw Exception(
          'Requests for repos of user: $username failed. Error => $e');
    }
  }

  @override
  Future<GitUserModel> getUser(String username) async {
    try {
      final response = await _dio.get('/users/$username');

      final data = GitUserModel.fromJson(response.data);
      return data;
    } catch (e) {
      throw Exception('Requests for user: $username failed. Error => $e');
    }
  }
}
