import 'package:git_friend/infrastructure/database/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelperImpl implements DatabaseHelper {
  Database? _conection;

  @override
  Future<Database> get database async {
    if (_conection != null) return _conection!;
    _conection ??= await _initDatabase();

    if (_conection == null) {
      throw Exception('erro ao iniciar conexão com banco de dados');
    }
    return _conection!;
  }

  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'github.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(db, version) async {
    await db.execute('''
          CREATE TABLE users(
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
            following INTEGER
          )
        ''');
    db.execute('''
          CREATE TABLE repositories(
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
  }
}
