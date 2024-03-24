import 'package:flutter/material.dart';

class SearchUserPageController with ChangeNotifier {
  String _userSearch = '';

  String get userSearch => _userSearch;

  void setUserSearch(String search) {
    _userSearch = search;
    notifyListeners();
  }
}
