import 'package:flutter/material.dart';
import 'package:git_friend/infrastructure/repositores/db_memory_repository/db_memory_repository.dart';
import 'package:git_friend/shared/models/git_user_model.dart';
import 'package:git_friend/infrastructure/repositores/github_repository/api_github_repository.dart';
import 'package:git_friend/shared/models/git_user_repos_model.dart';

class SearchPageViewModel with ChangeNotifier {
  GitUserModel? gitUser;
  List<GitUserReposModel> listRepos = [];
  final ApiGitHubRepository _gitRepository;
  final DBMemoryRepository _dbMemoryRepository;

  final inputController = TextEditingController();
  String _username = '';

  bool isUserLoading = false;
  bool isReposLoading = false;
  bool isUserError = false;
  String userError = '';

  SearchPageViewModel(this._gitRepository, this._dbMemoryRepository);

  Future<void> onSearch() async {
    if (inputController.text.isEmpty) return;

    _username = inputController.text.replaceAll(' ', '');
    isUserLoading = true;
    final result = await _gitRepository.getUser(_username);

    isUserLoading = false;
    if (!result.success) {
      isUserError = true;
      userError = result.message;
      notifyListeners();
      return;
    }

    gitUser = result.data;

    notifyListeners();
    return;
  }

  Future<void> onReposSearch() async {
    final result = await _gitRepository.getRepos(_username);

    if (!result.success) return;

    listRepos = [...result.data];
    notifyListeners();

    return;
  }

  Future<String?> setFavoriteUser(
      GitUserModel user, List<GitUserReposModel> userRepos) async {
    if (gitUser == null) return null;
    final result = await _dbMemoryRepository.setUserFavorite(user, userRepos);

    notifyListeners();
    if (!result.success) return result.message;
    return null;
  }
}
