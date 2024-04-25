import 'package:dio/dio.dart';
import 'package:git_friend/infrastructure/database/userDatabaseDao/user_database_dao.dart';
import 'package:git_friend/infrastructure/repositores/db_memory_repository/db_memory_repository.dart';
import 'package:git_friend/shared/models/git_user_model.dart';
import 'package:git_friend/shared/models/git_user_repos_model.dart';
import 'package:git_friend/shared/utils/result_action_util.dart';
import 'package:sqflite/sqflite.dart';

class DBMemoryRepositoryImpl implements DBMemoryRepository {
  final UserDatabaseDAO _db;

  DBMemoryRepositoryImpl({required UserDatabaseDAO db}) : _db = db;

  @override
  Future<ResultActionDTO> setUserFavorite(
      GitUserModel gitUser, List<GitUserReposModel> repos) async {
    try {
      final user = gitUser.toMap();

      for (var repo in repos) {
        repo.userId = gitUser.userId;
      }

      final repositories = repos.map((e) => e.toMap()).toList();

      await _db.insertUser(user);

      await _db.insertRepository(repositories);
      return ResultActionDTO.success();
    } on DatabaseException catch (error) {
      return ResultActionDTO.failure(error.toString());
    } catch (error) {
      print('error in setUserFavorite => $error');
      return ResultActionDTO.failure(
        'Ocorreu um erro ao favoritar o usuário',
      );
    }
  }

  @override
  Future<ResultActionDTO> getUsersFavoritesList() async {
    try {
      final response = await _db.getUsers();
      final usersList =
          response.map((user) => GitUserModel.fromMap(user)).toList();

      return ResultActionDTO.success(data: usersList);
    } on DatabaseException catch (error) {
      return ResultActionDTO.failure(error.toString());
    } catch (error) {
      print('error in getUsersFavoritesList => $error');
      return ResultActionDTO.failure(
        'Ocorreu um erro ao buscar os usuários',
      );
    }
  }

  @override
  Future<ResultActionDTO> getUserReposFavoriteList(int userId) async {
    try {
      final response = await _db.getRepositoriesByUserId(userId);

      final usersReposList =
          response.map((repo) => GitUserReposModel.fromMap(repo)).toList();

      return ResultActionDTO.success(data: usersReposList);
    } on DatabaseException catch (error) {
      return ResultActionDTO.failure(error.toString());
    } catch (error) {
      print('error in getUserReposFavoriteList => $error');
      return ResultActionDTO.failure(
        'Ocorreu um erro ao buscar os repositorios',
      );
    }
  }

  @override
  Future<ResultActionDTO> removeUserFavorite(int userId) async {
    try {
      await _db.deleteUser(userId);
      return ResultActionDTO.success();
    } on DioException catch (error) {
      final response = error.response;

      if (response?.statusCode == null) {
        return ResultActionDTO.failure(response!.data['message']);
      }

      if (response!.headers.map['content-type'] == null ||
          response.headers.map['content-type']!.contains('text/html')) {
        return ResultActionDTO.failure(response.data['message']);
      }

      return ResultActionDTO.failure(response.data['message']);
    } catch (error) {
      print('error in removeUserFavorite => $error');
      return ResultActionDTO.failure(
        'Ocorreu um erro ao remover o usuário dos favoritos',
      );
    }
  }
}
