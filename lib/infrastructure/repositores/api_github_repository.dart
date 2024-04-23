import 'package:git_friend/shared/utils/result_action_util.dart';

abstract class ApiGitHubRepository {
  Future<ResultActionDTO> getUser(String username);

  Future<ResultActionDTO> getRepos(String username);
}
