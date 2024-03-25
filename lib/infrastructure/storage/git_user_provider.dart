import 'package:flutter/material.dart';
import 'package:git_friend/shared/models/git_user_model.dart';

class GitUserProvider extends ChangeNotifier {
  final List<GitUserModel> _gitUsers = [];

  List<GitUserModel> get gitUsers => _gitUsers;

  toggleFavorite(GitUserModel gitUser) {
    final userIndex =
        _gitUsers.indexWhere((user) => user.userId == gitUser.userId);

    if (userIndex != -1) {
      _gitUsers[userIndex].isFavorite = false;
      _gitUsers.removeWhere((user) => user.userId == gitUser.userId);
    } else {
      _gitUsers.add(
        GitUserModel(
          userId: gitUser.userId,
          login: gitUser.login,
          avatar: gitUser.avatar,
          url: gitUser.url,
          name: gitUser.name,
          blog: gitUser.blog,
          email: gitUser.email,
          description: gitUser.description,
          twitter: gitUser.twitter,
          reposQuantity: gitUser.reposQuantity,
          followers: gitUser.followers,
          following: gitUser.following,
          isFavorite: true,
        ),
      );
    }

    notifyListeners();
  }
}
