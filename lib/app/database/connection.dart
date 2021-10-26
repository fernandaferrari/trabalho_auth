import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Connection {
  Connection._();

  static final Connection instance = Connection._();
  static Database? _database;

  get database async {
    if (_database != null) return _database;

    return await _initDatabase();
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), 'catalogo');
    return _database = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, version) async {
    await db.execute(auth);
  }
}

String get auth => '''
  CREATE TABLE auth(
    id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT,
    password TEXT,
  );
  ''';
