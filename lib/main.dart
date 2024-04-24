import 'package:flutter/material.dart';
import 'package:git_friend/git_friends.dart';
import 'package:git_friend/infrastructure/database/database_helper_impl.dart';
import 'package:git_friend/shared/dependency_injector/dependency_injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjector();
  runApp(const GitFriends());
}
