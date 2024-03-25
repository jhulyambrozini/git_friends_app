import 'package:flutter/material.dart';
import 'package:git_friend/shared/models/git_user_model.dart';
import 'package:git_friend/infrastructure/repositores/api_github__repository.dart';

class ApiGitHubViewModel {
  final gitUserModel = ValueNotifier<GitUserModel?>(null);
  final ApiGitHubRepository _repository;

  ApiGitHubViewModel(this._repository);

  fill(String username) async {
    gitUserModel.value =
        GitUserModel.fromJson(await _repository.getUser(username));
  }
}
