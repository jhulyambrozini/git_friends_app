import 'package:flutter/material.dart';
import 'package:git_friend/git_friends.dart';
import 'package:git_friend/shared/dependency_injector/dependency_injector.dart';

void main() {
  DependencyInjector();
  runApp(const GitFriends());
}
