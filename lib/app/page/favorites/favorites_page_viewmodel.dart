import 'package:flutter/material.dart';
import 'package:git_friend/shared/models/git_user_model.dart';

class FavoritesPageViewModel with ChangeNotifier {
  List<GitUserModel> gitUsers = [];
}
