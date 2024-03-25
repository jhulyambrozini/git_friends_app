import 'package:flutter/material.dart';
import 'package:git_friend/app/viewmodels/api_github_viewmodel.dart';

class SearchUserPageController with ChangeNotifier {
  final userSearch = ValueNotifier<String>('');
  final ApiGitHubViewModel viewModel;

  SearchUserPageController(this.viewModel);

  ValueNotifier get user => viewModel.gitUserModel;

  void setUserSearch(String search) {
    userSearch.value = search;
    viewModel.fill(search);
    notifyListeners();
  }
}
