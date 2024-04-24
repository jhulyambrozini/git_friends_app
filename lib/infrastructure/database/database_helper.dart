import 'package:git_friend/shared/models/git_user_model.dart';
import 'package:git_friend/shared/models/git_user_repos_model.dart';

abstract class DatabaseHelper {
  Future<void> initDatabase();

  Future<void> insertUser(Map<String, dynamic> user);

  Future<List<Map<String, dynamic>>> getUsers();

  Future<void> deleteUser(int userId);

  Future<void> insertRepository(List<GitUserReposModel> repositories);

  Future<List<GitUserReposModel>> getRepositoriesByUserId(int userId);
}
