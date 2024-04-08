import 'package:git_friend/shared/models/git_user_model.dart';
import 'package:git_friend/shared/models/git_user_repos_model.dart';

abstract class ApiGitHubRepository {
  Future<GitUserModel> getUser(String username);

  Future<List<GitUserReposModel>> getRepos(String username);
}
