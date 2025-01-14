import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  DatabaseHelper._privateConstructor();


  factory DatabaseHelper() => instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'stuff_spirit.db');
    // print('db path: $path');

    // await deleteDatabase(path);

    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // テーブル作成
    await db.execute('''
      CREATE TABLE photos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        photo_url TEXT NOT NULL,
        soul_id INTEGER,
        FOREIGN KEY (soul_id) REFERENCES souls (id)
      )
    ''');

    await db.execute('''
      CREATE TABLE souls (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        nfc_id TEXT NOT NULL,
        icon_url TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE emotions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        type TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE user_emotions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        emotion_id INTEGER,
        soul_id INTEGER,
        FOREIGN KEY (soul_id) REFERENCES souls (id),
        FOREIGN KEY (emotion_id) REFERENCES emotions (id)
      )
    ''');
  }

  Future<void> insertTestData() async {
    final db = await database;

    await db.insert('emotions', {'type': 'Happy'});
    await db.insert('emotions', {'type': 'Sad'});
  }

  Future<List<Map<String, dynamic>>> getPhotos() async {
    final db = await database;
    return await db.query('photos');
  }

  Future<List<Map<String, dynamic>>> getAllSouls() async {
    final db = await database;
    return await db.query('souls');
  }

  Future<int> insertSoul(Map<String, dynamic> row) async {
    final db = await database;
    return await db.insert('souls', row);
  }
}
