import 'package:git_friend/infrastructure/database/database_helper.dart';
import 'package:git_friend/infrastructure/database/userDatabaseDao/user_database_dao.dart';

class UserDatabaseDAOImpl implements UserDatabaseDAO {
  DatabaseHelper _db;

  UserDatabaseDAOImpl(this._db);

  @override
  Future<void> insertUser(Map<String, dynamic> user) async {
    final database = await _db.database;

    await database.insert('users', user);
  }

  @override
  Future<List<Map<String, dynamic>>> getUsers() async {
    final database = await _db.database;

    final List<Map<String, dynamic>> maps = await database.query('users');

    return List.generate(maps.length, (i) {
      return maps[i];
    });
  }

  @override
  Future<void> deleteUser(int userId) async {
    final database = await _db.database;

    await database.delete(
      'users',
      where: 'user_id = ?',
      whereArgs: [userId],
    );
  }

  @override
  Future<void> insertRepository(List<Map<String, dynamic>> repositories) async {
    final database = await _db.database;

    final batch = database.batch();
    for (var repository in repositories) {
      batch.insert('repositories', repository);
    }
    await batch.commit(noResult: true);
  }

  @override
  Future<List<Map<String, dynamic>>> getRepositoriesByUserId(int userId) async {
    final database = await _db.database;

    final List<Map<String, dynamic>> maps = await database.query(
      'repositories',
      where: 'user_id = ?',
      whereArgs: [userId],
    );
    return List.generate(maps.length, (i) {
      return maps[i];
    });
  }
}
