import 'package:git_friend/shared/models/git_user_model.dart';

abstract class ApiGitHubRepository {
  Future getUser(String username);

  Future<GitUserModel?> getRepos(String username);
}
