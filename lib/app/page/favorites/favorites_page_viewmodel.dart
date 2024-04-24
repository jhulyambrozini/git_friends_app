import 'package:flutter/material.dart';
import 'package:git_friend/infrastructure/repositores/db_memory_repository/db_memory_repository.dart';
import 'package:git_friend/shared/models/git_user_model.dart';
import 'package:git_friend/shared/models/git_user_repos_model.dart';

class FavoritesPageViewModel with ChangeNotifier {
  List<GitUserModel> favoriteUsersList = [];
  List<GitUserReposModel> listRepos = [];

  bool isUserLoading = true;
  bool isUserError = false;
  String userError = '';

  final DBMemoryRepository _dbMemoryRepository;

  FavoritesPageViewModel(this._dbMemoryRepository);

  Future<void> getfavoriteUsersList() async {
    isUserLoading = true;
    final result = await _dbMemoryRepository.getUsersFavoritesList();

    isUserLoading = false;

    if (!result.success) {
      isUserError = true;
      userError = result.message;
      notifyListeners();
      return;
    }

    favoriteUsersList = [...result.data];
    notifyListeners();
    return;
  }

  Future<String?> getUsersRepos(int userId) async {
    final result = await _dbMemoryRepository.getUserReposFavoriteList(userId);

    if (!result.success) return result.message;

    listRepos = [...result.data];
    notifyListeners();

    return null;
  }

  Future<String?> removeFavorite(int userId) async {
    final result = await _dbMemoryRepository.removeUserFavorite(userId);

    if (!result.success) return result.message;
    notifyListeners();
    return null;
  }
}
