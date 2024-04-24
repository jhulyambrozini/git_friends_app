import 'package:dio/dio.dart';
import 'package:git_friend/infrastructure/database/database_helper.dart';
import 'package:git_friend/infrastructure/repositores/db_memory_repository/db_memory_repository.dart';
import 'package:git_friend/shared/models/git_user_model.dart';
import 'package:git_friend/shared/models/git_user_repos_model.dart';
import 'package:git_friend/shared/utils/result_action_util.dart';
import 'package:sqflite/sqflite.dart';

class DBMemoryRepositoryImpl implements DBMemoryRepository {
  final DatabaseHelper _db;

  DBMemoryRepositoryImpl({required DatabaseHelper db}) : _db = db;

  @override
  Future<ResultActionDTO> setUserFavorite(
      GitUserModel gitUser, List<GitUserReposModel> repos) async {
    try {
      final user = gitUser.toMap();
      print(user);

      await _db.insertUser(user);
      await _db.insertRepository(repos);
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
      final usersList = await _db.getUsers();
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
      final usersReposList = await _db.getRepositoriesByUserId(userId);
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
