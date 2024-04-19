import 'package:git_friend/infrastructure/database/database_helper.dart';
import 'package:git_friend/shared/models/git_user_model.dart';
import 'package:git_friend/shared/models/git_user_repos_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelperImpl implements DatabaseHelper {
  late Database _db;

  @override
  Future<void> initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'github.db');

    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE IF NOT EXISTS TABLE users(
            user_id INTEGER PRIMARY KEY,
            login TEXT,
            avatar TEXT,
            url TEXT,
            name TEXT,
            blog TEXT,
            email TEXT NULL,
            description TEXT NULL,
            twitter TEXT NULL,
            repos_quantity INTEGER,
            followers INTEGER,
            following INTEGER,
            is_favorite INTEGER
          )
        ''');
        db.execute('''
          CREATE IF NOT EXISTS TABLE repositories(
            id INTEGER PRIMARY KEY,
            user_id INTEGER,
            name TEXT,
            url TEXT,
            description TEXT NULL,
            language TEXT NULL,
            created_at TEXT NULL,
            updated_at TEXT NULL,
            FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE
          )
        ''');
      },
    );
  }

  @override
  Future<void> insertUser(GitUserModel user) async {
    await _db.insert('users', user.toMap());
  }

  @override
  Future<List<GitUserModel>> getUsers() async {
    final List<Map<String, dynamic>> maps = await _db.query('users');
    return List.generate(maps.length, (i) {
      return GitUserModel.fromMap(maps[i]);
    });
  }

  @override
  Future<void> deleteUser(int userId) async {
    await _db.delete(
      'users',
      where: 'user_id = ?',
      whereArgs: [userId],
    );
  }

  @override
  Future<void> insertRepository(List<GitUserReposModel> repositories) async {
    final batch = _db.batch();
    for (var repository in repositories) {
      batch.insert('repositories', repository.toMap());
    }
    await batch.commit(noResult: true);
  }

  @override
  Future<List<GitUserReposModel>> getRepositoriesByUserId(int userId) async {
    final List<Map<String, dynamic>> maps = await _db.query(
      'repositories',
      where: 'user_id = ?',
      whereArgs: [userId],
    );
    return List.generate(maps.length, (i) {
      return GitUserReposModel.fromMap(maps[i]);
    });
  }
}
