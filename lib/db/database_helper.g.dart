// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_helper.dart';

// ignore_for_file: type=lint
class $SoulsTable extends Souls with TableInfo<$SoulsTable, Soul> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SoulsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _nfcIdMeta = const VerificationMeta('nfcId');
  @override
  late final GeneratedColumn<String> nfcId = GeneratedColumn<String>(
      'nfc_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _iconUrlMeta =
      const VerificationMeta('iconUrl');
  @override
  late final GeneratedColumn<String> iconUrl = GeneratedColumn<String>(
      'icon_url', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, nfcId, iconUrl];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'souls';
  @override
  VerificationContext validateIntegrity(Insertable<Soul> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('nfc_id')) {
      context.handle(
          _nfcIdMeta, nfcId.isAcceptableOrUnknown(data['nfc_id']!, _nfcIdMeta));
    } else if (isInserting) {
      context.missing(_nfcIdMeta);
    }
    if (data.containsKey('icon_url')) {
      context.handle(_iconUrlMeta,
          iconUrl.isAcceptableOrUnknown(data['icon_url']!, _iconUrlMeta));
    } else if (isInserting) {
      context.missing(_iconUrlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Soul map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Soul(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      nfcId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nfc_id'])!,
      iconUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon_url'])!,
    );
  }

  @override
  $SoulsTable createAlias(String alias) {
    return $SoulsTable(attachedDatabase, alias);
  }
}

class Soul extends DataClass implements Insertable<Soul> {
  final int id;
  final String name;
  final String nfcId;
  final String iconUrl;
  const Soul(
      {required this.id,
      required this.name,
      required this.nfcId,
      required this.iconUrl});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['nfc_id'] = Variable<String>(nfcId);
    map['icon_url'] = Variable<String>(iconUrl);
    return map;
  }

  SoulsCompanion toCompanion(bool nullToAbsent) {
    return SoulsCompanion(
      id: Value(id),
      name: Value(name),
      nfcId: Value(nfcId),
      iconUrl: Value(iconUrl),
    );
  }

  factory Soul.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Soul(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      nfcId: serializer.fromJson<String>(json['nfcId']),
      iconUrl: serializer.fromJson<String>(json['iconUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'nfcId': serializer.toJson<String>(nfcId),
      'iconUrl': serializer.toJson<String>(iconUrl),
    };
  }

  Soul copyWith({int? id, String? name, String? nfcId, String? iconUrl}) =>
      Soul(
        id: id ?? this.id,
        name: name ?? this.name,
        nfcId: nfcId ?? this.nfcId,
        iconUrl: iconUrl ?? this.iconUrl,
      );
  Soul copyWithCompanion(SoulsCompanion data) {
    return Soul(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      nfcId: data.nfcId.present ? data.nfcId.value : this.nfcId,
      iconUrl: data.iconUrl.present ? data.iconUrl.value : this.iconUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Soul(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nfcId: $nfcId, ')
          ..write('iconUrl: $iconUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, nfcId, iconUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Soul &&
          other.id == this.id &&
          other.name == this.name &&
          other.nfcId == this.nfcId &&
          other.iconUrl == this.iconUrl);
}

class SoulsCompanion extends UpdateCompanion<Soul> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> nfcId;
  final Value<String> iconUrl;
  const SoulsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.nfcId = const Value.absent(),
    this.iconUrl = const Value.absent(),
  });
  SoulsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String nfcId,
    required String iconUrl,
  })  : name = Value(name),
        nfcId = Value(nfcId),
        iconUrl = Value(iconUrl);
  static Insertable<Soul> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? nfcId,
    Expression<String>? iconUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (nfcId != null) 'nfc_id': nfcId,
      if (iconUrl != null) 'icon_url': iconUrl,
    });
  }

  SoulsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? nfcId,
      Value<String>? iconUrl}) {
    return SoulsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      nfcId: nfcId ?? this.nfcId,
      iconUrl: iconUrl ?? this.iconUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nfcId.present) {
      map['nfc_id'] = Variable<String>(nfcId.value);
    }
    if (iconUrl.present) {
      map['icon_url'] = Variable<String>(iconUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SoulsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nfcId: $nfcId, ')
          ..write('iconUrl: $iconUrl')
          ..write(')'))
        .toString();
  }
}

class $PhotosTable extends Photos with TableInfo<$PhotosTable, Photo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PhotosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _photoUrlMeta =
      const VerificationMeta('photoUrl');
  @override
  late final GeneratedColumn<String> photoUrl = GeneratedColumn<String>(
      'photo_url', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _soulIdMeta = const VerificationMeta('soulId');
  @override
  late final GeneratedColumn<int> soulId = GeneratedColumn<int>(
      'soul_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES souls(id)');
  @override
  List<GeneratedColumn> get $columns => [id, photoUrl, soulId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'photos';
  @override
  VerificationContext validateIntegrity(Insertable<Photo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('photo_url')) {
      context.handle(_photoUrlMeta,
          photoUrl.isAcceptableOrUnknown(data['photo_url']!, _photoUrlMeta));
    } else if (isInserting) {
      context.missing(_photoUrlMeta);
    }
    if (data.containsKey('soul_id')) {
      context.handle(_soulIdMeta,
          soulId.isAcceptableOrUnknown(data['soul_id']!, _soulIdMeta));
    } else if (isInserting) {
      context.missing(_soulIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Photo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Photo(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      photoUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}photo_url'])!,
      soulId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}soul_id'])!,
    );
  }

  @override
  $PhotosTable createAlias(String alias) {
    return $PhotosTable(attachedDatabase, alias);
  }
}

class Photo extends DataClass implements Insertable<Photo> {
  final int id;
  final String photoUrl;
  final int soulId;
  const Photo({required this.id, required this.photoUrl, required this.soulId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['photo_url'] = Variable<String>(photoUrl);
    map['soul_id'] = Variable<int>(soulId);
    return map;
  }

  PhotosCompanion toCompanion(bool nullToAbsent) {
    return PhotosCompanion(
      id: Value(id),
      photoUrl: Value(photoUrl),
      soulId: Value(soulId),
    );
  }

  factory Photo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Photo(
      id: serializer.fromJson<int>(json['id']),
      photoUrl: serializer.fromJson<String>(json['photoUrl']),
      soulId: serializer.fromJson<int>(json['soulId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'photoUrl': serializer.toJson<String>(photoUrl),
      'soulId': serializer.toJson<int>(soulId),
    };
  }

  Photo copyWith({int? id, String? photoUrl, int? soulId}) => Photo(
        id: id ?? this.id,
        photoUrl: photoUrl ?? this.photoUrl,
        soulId: soulId ?? this.soulId,
      );
  Photo copyWithCompanion(PhotosCompanion data) {
    return Photo(
      id: data.id.present ? data.id.value : this.id,
      photoUrl: data.photoUrl.present ? data.photoUrl.value : this.photoUrl,
      soulId: data.soulId.present ? data.soulId.value : this.soulId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Photo(')
          ..write('id: $id, ')
          ..write('photoUrl: $photoUrl, ')
          ..write('soulId: $soulId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, photoUrl, soulId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Photo &&
          other.id == this.id &&
          other.photoUrl == this.photoUrl &&
          other.soulId == this.soulId);
}

class PhotosCompanion extends UpdateCompanion<Photo> {
  final Value<int> id;
  final Value<String> photoUrl;
  final Value<int> soulId;
  const PhotosCompanion({
    this.id = const Value.absent(),
    this.photoUrl = const Value.absent(),
    this.soulId = const Value.absent(),
  });
  PhotosCompanion.insert({
    this.id = const Value.absent(),
    required String photoUrl,
    required int soulId,
  })  : photoUrl = Value(photoUrl),
        soulId = Value(soulId);
  static Insertable<Photo> custom({
    Expression<int>? id,
    Expression<String>? photoUrl,
    Expression<int>? soulId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (photoUrl != null) 'photo_url': photoUrl,
      if (soulId != null) 'soul_id': soulId,
    });
  }

  PhotosCompanion copyWith(
      {Value<int>? id, Value<String>? photoUrl, Value<int>? soulId}) {
    return PhotosCompanion(
      id: id ?? this.id,
      photoUrl: photoUrl ?? this.photoUrl,
      soulId: soulId ?? this.soulId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (photoUrl.present) {
      map['photo_url'] = Variable<String>(photoUrl.value);
    }
    if (soulId.present) {
      map['soul_id'] = Variable<int>(soulId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PhotosCompanion(')
          ..write('id: $id, ')
          ..write('photoUrl: $photoUrl, ')
          ..write('soulId: $soulId')
          ..write(')'))
        .toString();
  }
}

class $EmotionsTable extends Emotions with TableInfo<$EmotionsTable, Emotion> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmotionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, type];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'emotions';
  @override
  VerificationContext validateIntegrity(Insertable<Emotion> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Emotion map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Emotion(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
    );
  }

  @override
  $EmotionsTable createAlias(String alias) {
    return $EmotionsTable(attachedDatabase, alias);
  }
}

class Emotion extends DataClass implements Insertable<Emotion> {
  final int id;
  final String type;
  const Emotion({required this.id, required this.type});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['type'] = Variable<String>(type);
    return map;
  }

  EmotionsCompanion toCompanion(bool nullToAbsent) {
    return EmotionsCompanion(
      id: Value(id),
      type: Value(type),
    );
  }

  factory Emotion.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Emotion(
      id: serializer.fromJson<int>(json['id']),
      type: serializer.fromJson<String>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'type': serializer.toJson<String>(type),
    };
  }

  Emotion copyWith({int? id, String? type}) => Emotion(
        id: id ?? this.id,
        type: type ?? this.type,
      );
  Emotion copyWithCompanion(EmotionsCompanion data) {
    return Emotion(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Emotion(')
          ..write('id: $id, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Emotion && other.id == this.id && other.type == this.type);
}

class EmotionsCompanion extends UpdateCompanion<Emotion> {
  final Value<int> id;
  final Value<String> type;
  const EmotionsCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
  });
  EmotionsCompanion.insert({
    this.id = const Value.absent(),
    required String type,
  }) : type = Value(type);
  static Insertable<Emotion> custom({
    Expression<int>? id,
    Expression<String>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
    });
  }

  EmotionsCompanion copyWith({Value<int>? id, Value<String>? type}) {
    return EmotionsCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmotionsCompanion(')
          ..write('id: $id, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

class $UserEmotionsTable extends UserEmotions
    with TableInfo<$UserEmotionsTable, UserEmotion> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserEmotionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _emotionIdMeta =
      const VerificationMeta('emotionId');
  @override
  late final GeneratedColumn<int> emotionId = GeneratedColumn<int>(
      'emotion_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES emotions(id)');
  static const VerificationMeta _soulIdMeta = const VerificationMeta('soulId');
  @override
  late final GeneratedColumn<int> soulId = GeneratedColumn<int>(
      'soul_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES souls(id)');
  @override
  List<GeneratedColumn> get $columns => [id, emotionId, soulId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_emotions';
  @override
  VerificationContext validateIntegrity(Insertable<UserEmotion> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('emotion_id')) {
      context.handle(_emotionIdMeta,
          emotionId.isAcceptableOrUnknown(data['emotion_id']!, _emotionIdMeta));
    } else if (isInserting) {
      context.missing(_emotionIdMeta);
    }
    if (data.containsKey('soul_id')) {
      context.handle(_soulIdMeta,
          soulId.isAcceptableOrUnknown(data['soul_id']!, _soulIdMeta));
    } else if (isInserting) {
      context.missing(_soulIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserEmotion map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserEmotion(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      emotionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}emotion_id'])!,
      soulId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}soul_id'])!,
    );
  }

  @override
  $UserEmotionsTable createAlias(String alias) {
    return $UserEmotionsTable(attachedDatabase, alias);
  }
}

class UserEmotion extends DataClass implements Insertable<UserEmotion> {
  final int id;
  final int emotionId;
  final int soulId;
  const UserEmotion(
      {required this.id, required this.emotionId, required this.soulId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['emotion_id'] = Variable<int>(emotionId);
    map['soul_id'] = Variable<int>(soulId);
    return map;
  }

  UserEmotionsCompanion toCompanion(bool nullToAbsent) {
    return UserEmotionsCompanion(
      id: Value(id),
      emotionId: Value(emotionId),
      soulId: Value(soulId),
    );
  }

  factory UserEmotion.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserEmotion(
      id: serializer.fromJson<int>(json['id']),
      emotionId: serializer.fromJson<int>(json['emotionId']),
      soulId: serializer.fromJson<int>(json['soulId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'emotionId': serializer.toJson<int>(emotionId),
      'soulId': serializer.toJson<int>(soulId),
    };
  }

  UserEmotion copyWith({int? id, int? emotionId, int? soulId}) => UserEmotion(
        id: id ?? this.id,
        emotionId: emotionId ?? this.emotionId,
        soulId: soulId ?? this.soulId,
      );
  UserEmotion copyWithCompanion(UserEmotionsCompanion data) {
    return UserEmotion(
      id: data.id.present ? data.id.value : this.id,
      emotionId: data.emotionId.present ? data.emotionId.value : this.emotionId,
      soulId: data.soulId.present ? data.soulId.value : this.soulId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserEmotion(')
          ..write('id: $id, ')
          ..write('emotionId: $emotionId, ')
          ..write('soulId: $soulId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, emotionId, soulId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserEmotion &&
          other.id == this.id &&
          other.emotionId == this.emotionId &&
          other.soulId == this.soulId);
}

class UserEmotionsCompanion extends UpdateCompanion<UserEmotion> {
  final Value<int> id;
  final Value<int> emotionId;
  final Value<int> soulId;
  const UserEmotionsCompanion({
    this.id = const Value.absent(),
    this.emotionId = const Value.absent(),
    this.soulId = const Value.absent(),
  });
  UserEmotionsCompanion.insert({
    this.id = const Value.absent(),
    required int emotionId,
    required int soulId,
  })  : emotionId = Value(emotionId),
        soulId = Value(soulId);
  static Insertable<UserEmotion> custom({
    Expression<int>? id,
    Expression<int>? emotionId,
    Expression<int>? soulId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (emotionId != null) 'emotion_id': emotionId,
      if (soulId != null) 'soul_id': soulId,
    });
  }

  UserEmotionsCompanion copyWith(
      {Value<int>? id, Value<int>? emotionId, Value<int>? soulId}) {
    return UserEmotionsCompanion(
      id: id ?? this.id,
      emotionId: emotionId ?? this.emotionId,
      soulId: soulId ?? this.soulId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (emotionId.present) {
      map['emotion_id'] = Variable<int>(emotionId.value);
    }
    if (soulId.present) {
      map['soul_id'] = Variable<int>(soulId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserEmotionsCompanion(')
          ..write('id: $id, ')
          ..write('emotionId: $emotionId, ')
          ..write('soulId: $soulId')
          ..write(')'))
        .toString();
  }
}

abstract class _$DatabaseHelper extends GeneratedDatabase {
  _$DatabaseHelper(QueryExecutor e) : super(e);
  $DatabaseHelperManager get managers => $DatabaseHelperManager(this);
  late final $SoulsTable souls = $SoulsTable(this);
  late final $PhotosTable photos = $PhotosTable(this);
  late final $EmotionsTable emotions = $EmotionsTable(this);
  late final $UserEmotionsTable userEmotions = $UserEmotionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [souls, photos, emotions, userEmotions];
}

typedef $$SoulsTableCreateCompanionBuilder = SoulsCompanion Function({
  Value<int> id,
  required String name,
  required String nfcId,
  required String iconUrl,
});
typedef $$SoulsTableUpdateCompanionBuilder = SoulsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> nfcId,
  Value<String> iconUrl,
});

final class $$SoulsTableReferences
    extends BaseReferences<_$DatabaseHelper, $SoulsTable, Soul> {
  $$SoulsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PhotosTable, List<Photo>> _photosRefsTable(
          _$DatabaseHelper db) =>
      MultiTypedResultKey.fromTable(db.photos,
          aliasName: $_aliasNameGenerator(db.souls.id, db.photos.soulId));

  $$PhotosTableProcessedTableManager get photosRefs {
    final manager = $$PhotosTableTableManager($_db, $_db.photos)
        .filter((f) => f.soulId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_photosRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$UserEmotionsTable, List<UserEmotion>>
      _userEmotionsRefsTable(_$DatabaseHelper db) =>
          MultiTypedResultKey.fromTable(db.userEmotions,
              aliasName:
                  $_aliasNameGenerator(db.souls.id, db.userEmotions.soulId));

  $$UserEmotionsTableProcessedTableManager get userEmotionsRefs {
    final manager = $$UserEmotionsTableTableManager($_db, $_db.userEmotions)
        .filter((f) => f.soulId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_userEmotionsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$SoulsTableFilterComposer
    extends Composer<_$DatabaseHelper, $SoulsTable> {
  $$SoulsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nfcId => $composableBuilder(
      column: $table.nfcId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get iconUrl => $composableBuilder(
      column: $table.iconUrl, builder: (column) => ColumnFilters(column));

  Expression<bool> photosRefs(
      Expression<bool> Function($$PhotosTableFilterComposer f) f) {
    final $$PhotosTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.photos,
        getReferencedColumn: (t) => t.soulId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PhotosTableFilterComposer(
              $db: $db,
              $table: $db.photos,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> userEmotionsRefs(
      Expression<bool> Function($$UserEmotionsTableFilterComposer f) f) {
    final $$UserEmotionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.userEmotions,
        getReferencedColumn: (t) => t.soulId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserEmotionsTableFilterComposer(
              $db: $db,
              $table: $db.userEmotions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$SoulsTableOrderingComposer
    extends Composer<_$DatabaseHelper, $SoulsTable> {
  $$SoulsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nfcId => $composableBuilder(
      column: $table.nfcId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get iconUrl => $composableBuilder(
      column: $table.iconUrl, builder: (column) => ColumnOrderings(column));
}

class $$SoulsTableAnnotationComposer
    extends Composer<_$DatabaseHelper, $SoulsTable> {
  $$SoulsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get nfcId =>
      $composableBuilder(column: $table.nfcId, builder: (column) => column);

  GeneratedColumn<String> get iconUrl =>
      $composableBuilder(column: $table.iconUrl, builder: (column) => column);

  Expression<T> photosRefs<T extends Object>(
      Expression<T> Function($$PhotosTableAnnotationComposer a) f) {
    final $$PhotosTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.photos,
        getReferencedColumn: (t) => t.soulId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PhotosTableAnnotationComposer(
              $db: $db,
              $table: $db.photos,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> userEmotionsRefs<T extends Object>(
      Expression<T> Function($$UserEmotionsTableAnnotationComposer a) f) {
    final $$UserEmotionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.userEmotions,
        getReferencedColumn: (t) => t.soulId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserEmotionsTableAnnotationComposer(
              $db: $db,
              $table: $db.userEmotions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$SoulsTableTableManager extends RootTableManager<
    _$DatabaseHelper,
    $SoulsTable,
    Soul,
    $$SoulsTableFilterComposer,
    $$SoulsTableOrderingComposer,
    $$SoulsTableAnnotationComposer,
    $$SoulsTableCreateCompanionBuilder,
    $$SoulsTableUpdateCompanionBuilder,
    (Soul, $$SoulsTableReferences),
    Soul,
    PrefetchHooks Function({bool photosRefs, bool userEmotionsRefs})> {
  $$SoulsTableTableManager(_$DatabaseHelper db, $SoulsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SoulsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SoulsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SoulsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> nfcId = const Value.absent(),
            Value<String> iconUrl = const Value.absent(),
          }) =>
              SoulsCompanion(
            id: id,
            name: name,
            nfcId: nfcId,
            iconUrl: iconUrl,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String nfcId,
            required String iconUrl,
          }) =>
              SoulsCompanion.insert(
            id: id,
            name: name,
            nfcId: nfcId,
            iconUrl: iconUrl,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$SoulsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {photosRefs = false, userEmotionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (photosRefs) db.photos,
                if (userEmotionsRefs) db.userEmotions
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (photosRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$SoulsTableReferences._photosRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SoulsTableReferences(db, table, p0).photosRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.soulId == item.id),
                        typedResults: items),
                  if (userEmotionsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$SoulsTableReferences._userEmotionsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SoulsTableReferences(db, table, p0)
                                .userEmotionsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.soulId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$SoulsTableProcessedTableManager = ProcessedTableManager<
    _$DatabaseHelper,
    $SoulsTable,
    Soul,
    $$SoulsTableFilterComposer,
    $$SoulsTableOrderingComposer,
    $$SoulsTableAnnotationComposer,
    $$SoulsTableCreateCompanionBuilder,
    $$SoulsTableUpdateCompanionBuilder,
    (Soul, $$SoulsTableReferences),
    Soul,
    PrefetchHooks Function({bool photosRefs, bool userEmotionsRefs})>;
typedef $$PhotosTableCreateCompanionBuilder = PhotosCompanion Function({
  Value<int> id,
  required String photoUrl,
  required int soulId,
});
typedef $$PhotosTableUpdateCompanionBuilder = PhotosCompanion Function({
  Value<int> id,
  Value<String> photoUrl,
  Value<int> soulId,
});

final class $$PhotosTableReferences
    extends BaseReferences<_$DatabaseHelper, $PhotosTable, Photo> {
  $$PhotosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SoulsTable _soulIdTable(_$DatabaseHelper db) =>
      db.souls.createAlias($_aliasNameGenerator(db.photos.soulId, db.souls.id));

  $$SoulsTableProcessedTableManager get soulId {
    final manager = $$SoulsTableTableManager($_db, $_db.souls)
        .filter((f) => f.id($_item.soulId));
    final item = $_typedResult.readTableOrNull(_soulIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$PhotosTableFilterComposer
    extends Composer<_$DatabaseHelper, $PhotosTable> {
  $$PhotosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get photoUrl => $composableBuilder(
      column: $table.photoUrl, builder: (column) => ColumnFilters(column));

  $$SoulsTableFilterComposer get soulId {
    final $$SoulsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.soulId,
        referencedTable: $db.souls,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SoulsTableFilterComposer(
              $db: $db,
              $table: $db.souls,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PhotosTableOrderingComposer
    extends Composer<_$DatabaseHelper, $PhotosTable> {
  $$PhotosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get photoUrl => $composableBuilder(
      column: $table.photoUrl, builder: (column) => ColumnOrderings(column));

  $$SoulsTableOrderingComposer get soulId {
    final $$SoulsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.soulId,
        referencedTable: $db.souls,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SoulsTableOrderingComposer(
              $db: $db,
              $table: $db.souls,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PhotosTableAnnotationComposer
    extends Composer<_$DatabaseHelper, $PhotosTable> {
  $$PhotosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get photoUrl =>
      $composableBuilder(column: $table.photoUrl, builder: (column) => column);

  $$SoulsTableAnnotationComposer get soulId {
    final $$SoulsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.soulId,
        referencedTable: $db.souls,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SoulsTableAnnotationComposer(
              $db: $db,
              $table: $db.souls,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PhotosTableTableManager extends RootTableManager<
    _$DatabaseHelper,
    $PhotosTable,
    Photo,
    $$PhotosTableFilterComposer,
    $$PhotosTableOrderingComposer,
    $$PhotosTableAnnotationComposer,
    $$PhotosTableCreateCompanionBuilder,
    $$PhotosTableUpdateCompanionBuilder,
    (Photo, $$PhotosTableReferences),
    Photo,
    PrefetchHooks Function({bool soulId})> {
  $$PhotosTableTableManager(_$DatabaseHelper db, $PhotosTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PhotosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PhotosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PhotosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> photoUrl = const Value.absent(),
            Value<int> soulId = const Value.absent(),
          }) =>
              PhotosCompanion(
            id: id,
            photoUrl: photoUrl,
            soulId: soulId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String photoUrl,
            required int soulId,
          }) =>
              PhotosCompanion.insert(
            id: id,
            photoUrl: photoUrl,
            soulId: soulId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$PhotosTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({soulId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (soulId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.soulId,
                    referencedTable: $$PhotosTableReferences._soulIdTable(db),
                    referencedColumn:
                        $$PhotosTableReferences._soulIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$PhotosTableProcessedTableManager = ProcessedTableManager<
    _$DatabaseHelper,
    $PhotosTable,
    Photo,
    $$PhotosTableFilterComposer,
    $$PhotosTableOrderingComposer,
    $$PhotosTableAnnotationComposer,
    $$PhotosTableCreateCompanionBuilder,
    $$PhotosTableUpdateCompanionBuilder,
    (Photo, $$PhotosTableReferences),
    Photo,
    PrefetchHooks Function({bool soulId})>;
typedef $$EmotionsTableCreateCompanionBuilder = EmotionsCompanion Function({
  Value<int> id,
  required String type,
});
typedef $$EmotionsTableUpdateCompanionBuilder = EmotionsCompanion Function({
  Value<int> id,
  Value<String> type,
});

final class $$EmotionsTableReferences
    extends BaseReferences<_$DatabaseHelper, $EmotionsTable, Emotion> {
  $$EmotionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UserEmotionsTable, List<UserEmotion>>
      _userEmotionsRefsTable(_$DatabaseHelper db) =>
          MultiTypedResultKey.fromTable(db.userEmotions,
              aliasName: $_aliasNameGenerator(
                  db.emotions.id, db.userEmotions.emotionId));

  $$UserEmotionsTableProcessedTableManager get userEmotionsRefs {
    final manager = $$UserEmotionsTableTableManager($_db, $_db.userEmotions)
        .filter((f) => f.emotionId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_userEmotionsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$EmotionsTableFilterComposer
    extends Composer<_$DatabaseHelper, $EmotionsTable> {
  $$EmotionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  Expression<bool> userEmotionsRefs(
      Expression<bool> Function($$UserEmotionsTableFilterComposer f) f) {
    final $$UserEmotionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.userEmotions,
        getReferencedColumn: (t) => t.emotionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserEmotionsTableFilterComposer(
              $db: $db,
              $table: $db.userEmotions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$EmotionsTableOrderingComposer
    extends Composer<_$DatabaseHelper, $EmotionsTable> {
  $$EmotionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));
}

class $$EmotionsTableAnnotationComposer
    extends Composer<_$DatabaseHelper, $EmotionsTable> {
  $$EmotionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  Expression<T> userEmotionsRefs<T extends Object>(
      Expression<T> Function($$UserEmotionsTableAnnotationComposer a) f) {
    final $$UserEmotionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.userEmotions,
        getReferencedColumn: (t) => t.emotionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserEmotionsTableAnnotationComposer(
              $db: $db,
              $table: $db.userEmotions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$EmotionsTableTableManager extends RootTableManager<
    _$DatabaseHelper,
    $EmotionsTable,
    Emotion,
    $$EmotionsTableFilterComposer,
    $$EmotionsTableOrderingComposer,
    $$EmotionsTableAnnotationComposer,
    $$EmotionsTableCreateCompanionBuilder,
    $$EmotionsTableUpdateCompanionBuilder,
    (Emotion, $$EmotionsTableReferences),
    Emotion,
    PrefetchHooks Function({bool userEmotionsRefs})> {
  $$EmotionsTableTableManager(_$DatabaseHelper db, $EmotionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EmotionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EmotionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EmotionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> type = const Value.absent(),
          }) =>
              EmotionsCompanion(
            id: id,
            type: type,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String type,
          }) =>
              EmotionsCompanion.insert(
            id: id,
            type: type,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$EmotionsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({userEmotionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (userEmotionsRefs) db.userEmotions],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (userEmotionsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$EmotionsTableReferences
                            ._userEmotionsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$EmotionsTableReferences(db, table, p0)
                                .userEmotionsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.emotionId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$EmotionsTableProcessedTableManager = ProcessedTableManager<
    _$DatabaseHelper,
    $EmotionsTable,
    Emotion,
    $$EmotionsTableFilterComposer,
    $$EmotionsTableOrderingComposer,
    $$EmotionsTableAnnotationComposer,
    $$EmotionsTableCreateCompanionBuilder,
    $$EmotionsTableUpdateCompanionBuilder,
    (Emotion, $$EmotionsTableReferences),
    Emotion,
    PrefetchHooks Function({bool userEmotionsRefs})>;
typedef $$UserEmotionsTableCreateCompanionBuilder = UserEmotionsCompanion
    Function({
  Value<int> id,
  required int emotionId,
  required int soulId,
});
typedef $$UserEmotionsTableUpdateCompanionBuilder = UserEmotionsCompanion
    Function({
  Value<int> id,
  Value<int> emotionId,
  Value<int> soulId,
});

final class $$UserEmotionsTableReferences
    extends BaseReferences<_$DatabaseHelper, $UserEmotionsTable, UserEmotion> {
  $$UserEmotionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $EmotionsTable _emotionIdTable(_$DatabaseHelper db) =>
      db.emotions.createAlias(
          $_aliasNameGenerator(db.userEmotions.emotionId, db.emotions.id));

  $$EmotionsTableProcessedTableManager get emotionId {
    final manager = $$EmotionsTableTableManager($_db, $_db.emotions)
        .filter((f) => f.id($_item.emotionId));
    final item = $_typedResult.readTableOrNull(_emotionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $SoulsTable _soulIdTable(_$DatabaseHelper db) => db.souls
      .createAlias($_aliasNameGenerator(db.userEmotions.soulId, db.souls.id));

  $$SoulsTableProcessedTableManager get soulId {
    final manager = $$SoulsTableTableManager($_db, $_db.souls)
        .filter((f) => f.id($_item.soulId));
    final item = $_typedResult.readTableOrNull(_soulIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$UserEmotionsTableFilterComposer
    extends Composer<_$DatabaseHelper, $UserEmotionsTable> {
  $$UserEmotionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  $$EmotionsTableFilterComposer get emotionId {
    final $$EmotionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.emotionId,
        referencedTable: $db.emotions,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EmotionsTableFilterComposer(
              $db: $db,
              $table: $db.emotions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SoulsTableFilterComposer get soulId {
    final $$SoulsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.soulId,
        referencedTable: $db.souls,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SoulsTableFilterComposer(
              $db: $db,
              $table: $db.souls,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$UserEmotionsTableOrderingComposer
    extends Composer<_$DatabaseHelper, $UserEmotionsTable> {
  $$UserEmotionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  $$EmotionsTableOrderingComposer get emotionId {
    final $$EmotionsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.emotionId,
        referencedTable: $db.emotions,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EmotionsTableOrderingComposer(
              $db: $db,
              $table: $db.emotions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SoulsTableOrderingComposer get soulId {
    final $$SoulsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.soulId,
        referencedTable: $db.souls,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SoulsTableOrderingComposer(
              $db: $db,
              $table: $db.souls,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$UserEmotionsTableAnnotationComposer
    extends Composer<_$DatabaseHelper, $UserEmotionsTable> {
  $$UserEmotionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$EmotionsTableAnnotationComposer get emotionId {
    final $$EmotionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.emotionId,
        referencedTable: $db.emotions,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EmotionsTableAnnotationComposer(
              $db: $db,
              $table: $db.emotions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SoulsTableAnnotationComposer get soulId {
    final $$SoulsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.soulId,
        referencedTable: $db.souls,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SoulsTableAnnotationComposer(
              $db: $db,
              $table: $db.souls,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$UserEmotionsTableTableManager extends RootTableManager<
    _$DatabaseHelper,
    $UserEmotionsTable,
    UserEmotion,
    $$UserEmotionsTableFilterComposer,
    $$UserEmotionsTableOrderingComposer,
    $$UserEmotionsTableAnnotationComposer,
    $$UserEmotionsTableCreateCompanionBuilder,
    $$UserEmotionsTableUpdateCompanionBuilder,
    (UserEmotion, $$UserEmotionsTableReferences),
    UserEmotion,
    PrefetchHooks Function({bool emotionId, bool soulId})> {
  $$UserEmotionsTableTableManager(_$DatabaseHelper db, $UserEmotionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserEmotionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserEmotionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserEmotionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> emotionId = const Value.absent(),
            Value<int> soulId = const Value.absent(),
          }) =>
              UserEmotionsCompanion(
            id: id,
            emotionId: emotionId,
            soulId: soulId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int emotionId,
            required int soulId,
          }) =>
              UserEmotionsCompanion.insert(
            id: id,
            emotionId: emotionId,
            soulId: soulId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$UserEmotionsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({emotionId = false, soulId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (emotionId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.emotionId,
                    referencedTable:
                        $$UserEmotionsTableReferences._emotionIdTable(db),
                    referencedColumn:
                        $$UserEmotionsTableReferences._emotionIdTable(db).id,
                  ) as T;
                }
                if (soulId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.soulId,
                    referencedTable:
                        $$UserEmotionsTableReferences._soulIdTable(db),
                    referencedColumn:
                        $$UserEmotionsTableReferences._soulIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$UserEmotionsTableProcessedTableManager = ProcessedTableManager<
    _$DatabaseHelper,
    $UserEmotionsTable,
    UserEmotion,
    $$UserEmotionsTableFilterComposer,
    $$UserEmotionsTableOrderingComposer,
    $$UserEmotionsTableAnnotationComposer,
    $$UserEmotionsTableCreateCompanionBuilder,
    $$UserEmotionsTableUpdateCompanionBuilder,
    (UserEmotion, $$UserEmotionsTableReferences),
    UserEmotion,
    PrefetchHooks Function({bool emotionId, bool soulId})>;

class $DatabaseHelperManager {
  final _$DatabaseHelper _db;
  $DatabaseHelperManager(this._db);
  $$SoulsTableTableManager get souls =>
      $$SoulsTableTableManager(_db, _db.souls);
  $$PhotosTableTableManager get photos =>
      $$PhotosTableTableManager(_db, _db.photos);
  $$EmotionsTableTableManager get emotions =>
      $$EmotionsTableTableManager(_db, _db.emotions);
  $$UserEmotionsTableTableManager get userEmotions =>
      $$UserEmotionsTableTableManager(_db, _db.userEmotions);
}
