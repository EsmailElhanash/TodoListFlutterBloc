import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabaseProvider {
  static const String dbName = 'my_app_database.db';
  LocalDatabaseProvider._(); // Private constructor to enforce singleton pattern
  static final LocalDatabaseProvider instance = LocalDatabaseProvider._();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final String path = join(await getDatabasesPath(), dbName);
    return openDatabase(
      path,
      version:
          1, // Change this when you need to perform database schema updates
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE tasks (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT,
            isCompleted INTEGER
          )
        ''');
      },
    );
  }
}
