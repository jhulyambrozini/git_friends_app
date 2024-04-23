import 'package:flutter/material.dart';
import 'package:git_friend/shared/models/git_user_model.dart';
import 'package:git_friend/infrastructure/repositores/api_github_repository.dart';
import 'package:git_friend/shared/models/git_user_repos_model.dart';

class SearchPageViewModel with ChangeNotifier {
  GitUserModel? gitUser;
  List<GitUserReposModel> listRepos = [];
  final ApiGitHubRepository _repository;

  SearchPageViewModel(this._repository);

  void onSearch(String username) async {
    final userResponse = await _repository.getUser(username);

    gitUser = userResponse;

    notifyListeners();
  }

  void onPress(String username) async {
    final reposResponse = await _repository.getRepos(username);
    listRepos = [...reposResponse];
    notifyListeners();
  }

  void onToggleFavorite() {
    notifyListeners();
  }
}
