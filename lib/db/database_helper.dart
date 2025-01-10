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

    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
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
        nfc_id TEXT NOT NULL,
        icon TEXT,
        icon_url TEXT
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
    // await _insertTestData(db);
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute('ALTER TABLE spirits ADD COLUMN icon_url TEXT');
  }

  Future<void> insertTestData() async {
    final db = await database;
    // spirits テーブルのデータ
    await db.insert('spirits', {'name': 'Spirit A', 'nfc_id': 'NFC001', 'icon_url': 'assets/images/spirits/icon1.png'});
    await db.insert('spirits', {'name': 'Spirit B', 'nfc_id': 'NFC002', 'icon_url': 'assets/images/spirits/icon2.png'});

    // emotions テーブルのデータ
    await db.insert('emotions', {'type': 'Happy', 'spirit_id': 1});
    await db.insert('emotions', {'type': 'Sad', 'spirit_id': 2});

    // photos テーブルのデータ
    await db.insert('photos', {'photo': 'assets/images/phots/photo1.png', 'emotion_id': 1, 'spirit_id': 1});
    await db.insert('photos', {'photo': 'assets/images/photos/photo2.png', 'emotion_id': 2, 'spirit_id': 2});
  }

  Future<void> deleteAllData() async {
    final db = await database;
    await db.delete('spirits');
    await db.delete('emotions');
    await db.delete('photos');
  }

  // 必要に応じてデータ取得関数を追加
  Future<List<Map<String, dynamic>>> getPhotos() async {
    final db = await database;
    return await db.query('photos');
  }

  Future<List<Map<String, dynamic>>> getAllSpirits() async {
    final db = await database;
    return await db.query('spirits');
  }
}
