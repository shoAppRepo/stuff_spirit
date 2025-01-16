import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'database_helper.g.dart';

@DriftDatabase(tables: [Photos, Souls, Emotions, UserEmotions])
class DatabaseHelper extends _$DatabaseHelper {
  DatabaseHelper() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> addSoul(SoulsCompanion soul) async {
    return await into(souls).insert(soul);
  }

  Future<int> addPhoto(PhotosCompanion photo) async {
    return await into(photos).insert(photo);
  }

  Future<List<Soul>> getAllSouls() async {
    return await select(souls).get();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'stuff_spirit.db'));
    return NativeDatabase(file);
  });
}

@DataClassName('Photo')
class Photos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get photoUrl => text().withLength(min: 1, max: 255)();
  IntColumn get soulId => integer().customConstraint('REFERENCES souls(id)')();
}

@DataClassName('Soul')
class Souls extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 255)();
  TextColumn get nfcId => text().withLength(min: 1, max: 255)();
  TextColumn get iconUrl => text().withLength(min: 1, max: 255)();
}

@DataClassName('Emotion')
class Emotions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text().withLength(min: 1, max: 255)();
}

@DataClassName('UserEmotion')
class UserEmotions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get emotionId => integer().customConstraint('REFERENCES emotions(id)')();
  IntColumn get soulId => integer().customConstraint('REFERENCES souls(id)')();
}
