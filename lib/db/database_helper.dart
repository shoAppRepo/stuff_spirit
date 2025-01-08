import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'stuff_spirit.db');
    print("Database path: $path");

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // テーブル作成
    await db.execute('''
      CREATE TABLE photos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        photo TEXT NOT NULL,
        emotion_id INTEGER,
        spirit_id INTEGER,
        FOREIGN KEY (emotion_id) REFERENCES emotions (id),
        FOREIGN KEY (spirit_id) REFERENCES spirits (id)
      )
    ''');

    await db.execute('''
      CREATE TABLE spirits (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        nfc_id TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE emotions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        type TEXT NOT NULL,
        spirit_id INTEGER,
        FOREIGN KEY (spirit_id) REFERENCES spirits (id)
      )
    ''');

    // テストデータ挿入
    await _insertTestData(db);
  }

  Future<void> _insertTestData(Database db) async {
    // spirits テーブルのデータ
    await db.insert('spirits', {'name': 'Spirit A', 'nfc_id': 'NFC001'});
    await db.insert('spirits', {'name': 'Spirit B', 'nfc_id': 'NFC002'});

    // emotions テーブルのデータ
    await db.insert('emotions', {'type': 'Happy', 'spirit_id': 1});
    await db.insert('emotions', {'type': 'Sad', 'spirit_id': 2});

    // photos テーブルのデータ
    await db.insert('photos', {'photo': 'path/to/photo1.jpg', 'emotion_id': 1, 'spirit_id': 1});
    await db.insert('photos', {'photo': 'path/to/photo2.jpg', 'emotion_id': 2, 'spirit_id': 2});
  }

  // 必要に応じてデータ取得関数を追加
  Future<List<Map<String, dynamic>>> getPhotos() async {
    final db = await database;
    return await db.query('photos');
  }
}
