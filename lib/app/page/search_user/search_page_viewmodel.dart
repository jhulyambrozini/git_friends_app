import 'package:flutter/material.dart';
import 'package:git_friend/shared/models/git_user_model.dart';
import 'package:git_friend/infrastructure/repositores/github_repository/api_github_repository.dart';
import 'package:git_friend/shared/models/git_user_repos_model.dart';

class SearchPageViewModel with ChangeNotifier {
  GitUserModel? gitUser;
  List<GitUserReposModel> listRepos = [];
  final ApiGitHubRepository _repository;

  final inputController = TextEditingController();
  String _username = '';

  bool isUserLoading = false;
  bool isReposLoading = false;
  bool isUserError = false;
  String userError = '';

  SearchPageViewModel(this._repository);

  Future<void> onSearch() async {
    if (inputController.text.isEmpty) return;

    _username = inputController.text.replaceAll(' ', '');
    isUserLoading = true;
    final result = await _repository.getUser(_username);

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
    final result = await _repository.getRepos(_username);

    if (!result.success) return;

    listRepos = [...result.data];
    notifyListeners();

    return;
  }

  void onToggleFavorite() {
    notifyListeners();
  }
}
