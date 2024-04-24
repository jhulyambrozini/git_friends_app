import 'package:dio/dio.dart';
import 'package:git_friend/infrastructure/api/api_routes.dart';
import 'package:git_friend/infrastructure/api/api_client_impl.dart';
import 'package:git_friend/shared/models/git_user_model.dart';
import 'package:git_friend/infrastructure/repositores/github_repository/api_github_repository.dart';
import 'package:git_friend/shared/models/git_user_repos_model.dart';
import 'package:git_friend/shared/utils/result_action_util.dart';

class ApiGitHubRepositoryImpl implements ApiGitHubRepository {
  final ApiClientImpl _apiClient;

  ApiGitHubRepositoryImpl(this._apiClient);

  @override
  Future<ResultActionDTO> getRepos(String username) async {
    try {
      final response = await _apiClient.get(ApiRoutes.getRepos(username));

      final List<dynamic> responseData = response.data;
      final List<GitUserReposModel> data = responseData
          .map((repo) =>
              GitUserReposModel.fromJson(repo as Map<String, dynamic>))
          .toList();

      return ResultActionDTO.success(data: data);
    } on DioException catch (error) {
      final response = error.response;

      if (response?.statusCode == null) {
        return ResultActionDTO.failure(response!.data['message']);
      }

      if (response!.headers.map['content-type'] == null ||
          response.headers.map['content-type']!.contains('text/html')) {
        return ResultActionDTO.failure(response.data['message']);
      }

      return ResultActionDTO.failure(response.data['message']);
    } catch (error) {
      print('error in getRepos => $error');
      return ResultActionDTO.failure(
        'Ocorreu um erro ao buscar os repositórios',
      );
    }
  }

  @override
  Future<ResultActionDTO> getUser(String username) async {
    try {
      final response = await _apiClient.get(ApiRoutes.getUser(username));

      final data = GitUserModel.fromJson(response.data);
      return ResultActionDTO.success(data: data);
    } on DioException catch (error) {
      final response = error.response;

      if (response?.statusCode == null) {
        return ResultActionDTO.failure(response!.data['message']);
      }

      if (response!.headers.map['content-type'] == null ||
          response.headers.map['content-type']!.contains('text/html')) {
        return ResultActionDTO.failure(response.data['message']);
      }

      return ResultActionDTO.failure(response.data['message']);
    } catch (error) {
      print('error in getUsers => $error');
      return ResultActionDTO.failure(
        'Ocorreu um erro ao buscar o usuário',
      );
    }
  }
}
