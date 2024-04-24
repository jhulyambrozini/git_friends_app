import 'package:git_friend/shared/models/git_user_model.dart';
import 'package:git_friend/shared/models/git_user_repos_model.dart';
import 'package:git_friend/shared/utils/result_action_util.dart';

abstract class DBMemoryRepository {
  Future<ResultActionDTO> getUsersFavoritesList();
  Future<ResultActionDTO> getUserReposFavoriteList(int userId);

  Future<ResultActionDTO> removeUserFavorite(int userId);

  Future<ResultActionDTO> setUserFavorite(
      GitUserModel user, List<GitUserReposModel> repos);
}
