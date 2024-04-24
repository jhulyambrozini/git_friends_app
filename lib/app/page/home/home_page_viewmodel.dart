import 'package:flutter/material.dart';
import 'package:git_friend/infrastructure/database/database_helper.dart';

class HomePageViewModel with ChangeNotifier {
  final DatabaseHelper _database;

  HomePageViewModel(this._database) {
    // _initDatabase();
  }

  int selectedIndex = 0;

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  // Future<void> _initDatabase() async {
  //   try {
  //     await _database.initDatabase();
  //     notifyListeners();
  //   } catch (e) {
  //     print('initDataBaseError: $e');
  //   }
  // }
}
