// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_module.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class FriendsTableData extends DataClass
    implements Insertable<FriendsTableData> {
  final int id;
  final String idUser;
  final String nameUser;
  final bool isFriends;
  FriendsTableData(
      {required this.id,
      required this.idUser,
      required this.nameUser,
      required this.isFriends});
  factory FriendsTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return FriendsTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      idUser: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_user'])!,
      nameUser: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name_user'])!,
      isFriends: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_friends'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_user'] = Variable<String>(idUser);
    map['name_user'] = Variable<String>(nameUser);
    map['is_friends'] = Variable<bool>(isFriends);
    return map;
  }

  FriendsTableCompanion toCompanion(bool nullToAbsent) {
    return FriendsTableCompanion(
      id: Value(id),
      idUser: Value(idUser),
      nameUser: Value(nameUser),
      isFriends: Value(isFriends),
    );
  }

  factory FriendsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FriendsTableData(
      id: serializer.fromJson<int>(json['id']),
      idUser: serializer.fromJson<String>(json['idUser']),
      nameUser: serializer.fromJson<String>(json['nameUser']),
      isFriends: serializer.fromJson<bool>(json['isFriends']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idUser': serializer.toJson<String>(idUser),
      'nameUser': serializer.toJson<String>(nameUser),
      'isFriends': serializer.toJson<bool>(isFriends),
    };
  }

  FriendsTableData copyWith(
          {int? id, String? idUser, String? nameUser, bool? isFriends}) =>
      FriendsTableData(
        id: id ?? this.id,
        idUser: idUser ?? this.idUser,
        nameUser: nameUser ?? this.nameUser,
        isFriends: isFriends ?? this.isFriends,
      );
  @override
  String toString() {
    return (StringBuffer('FriendsTableData(')
          ..write('id: $id, ')
          ..write('idUser: $idUser, ')
          ..write('nameUser: $nameUser, ')
          ..write('isFriends: $isFriends')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, idUser, nameUser, isFriends);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FriendsTableData &&
          other.id == this.id &&
          other.idUser == this.idUser &&
          other.nameUser == this.nameUser &&
          other.isFriends == this.isFriends);
}

class FriendsTableCompanion extends UpdateCompanion<FriendsTableData> {
  final Value<int> id;
  final Value<String> idUser;
  final Value<String> nameUser;
  final Value<bool> isFriends;
  const FriendsTableCompanion({
    this.id = const Value.absent(),
    this.idUser = const Value.absent(),
    this.nameUser = const Value.absent(),
    this.isFriends = const Value.absent(),
  });
  FriendsTableCompanion.insert({
    this.id = const Value.absent(),
    required String idUser,
    required String nameUser,
    this.isFriends = const Value.absent(),
  })  : idUser = Value(idUser),
        nameUser = Value(nameUser);
  static Insertable<FriendsTableData> custom({
    Expression<int>? id,
    Expression<String>? idUser,
    Expression<String>? nameUser,
    Expression<bool>? isFriends,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idUser != null) 'id_user': idUser,
      if (nameUser != null) 'name_user': nameUser,
      if (isFriends != null) 'is_friends': isFriends,
    });
  }

  FriendsTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? idUser,
      Value<String>? nameUser,
      Value<bool>? isFriends}) {
    return FriendsTableCompanion(
      id: id ?? this.id,
      idUser: idUser ?? this.idUser,
      nameUser: nameUser ?? this.nameUser,
      isFriends: isFriends ?? this.isFriends,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idUser.present) {
      map['id_user'] = Variable<String>(idUser.value);
    }
    if (nameUser.present) {
      map['name_user'] = Variable<String>(nameUser.value);
    }
    if (isFriends.present) {
      map['is_friends'] = Variable<bool>(isFriends.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FriendsTableCompanion(')
          ..write('id: $id, ')
          ..write('idUser: $idUser, ')
          ..write('nameUser: $nameUser, ')
          ..write('isFriends: $isFriends')
          ..write(')'))
        .toString();
  }
}

class $FriendsTableTable extends FriendsTable
    with TableInfo<$FriendsTableTable, FriendsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FriendsTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _idUserMeta = const VerificationMeta('idUser');
  @override
  late final GeneratedColumn<String?> idUser = GeneratedColumn<String?>(
      'id_user', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _nameUserMeta = const VerificationMeta('nameUser');
  @override
  late final GeneratedColumn<String?> nameUser = GeneratedColumn<String?>(
      'name_user', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _isFriendsMeta = const VerificationMeta('isFriends');
  @override
  late final GeneratedColumn<bool?> isFriends = GeneratedColumn<bool?>(
      'is_friends', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_friends IN (0, 1))',
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [id, idUser, nameUser, isFriends];
  @override
  String get aliasedName => _alias ?? 'friends_table';
  @override
  String get actualTableName => 'friends_table';
  @override
  VerificationContext validateIntegrity(Insertable<FriendsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_user')) {
      context.handle(_idUserMeta,
          idUser.isAcceptableOrUnknown(data['id_user']!, _idUserMeta));
    } else if (isInserting) {
      context.missing(_idUserMeta);
    }
    if (data.containsKey('name_user')) {
      context.handle(_nameUserMeta,
          nameUser.isAcceptableOrUnknown(data['name_user']!, _nameUserMeta));
    } else if (isInserting) {
      context.missing(_nameUserMeta);
    }
    if (data.containsKey('is_friends')) {
      context.handle(_isFriendsMeta,
          isFriends.isAcceptableOrUnknown(data['is_friends']!, _isFriendsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FriendsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return FriendsTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $FriendsTableTable createAlias(String alias) {
    return $FriendsTableTable(attachedDatabase, alias);
  }
}

class PostTableData extends DataClass implements Insertable<PostTableData> {
  final int id;
  final String idUser;
  final String idPost;
  final int qty;
  final bool isLike;
  PostTableData(
      {required this.id,
      required this.idUser,
      required this.idPost,
      required this.qty,
      required this.isLike});
  factory PostTableData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PostTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      idUser: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_user'])!,
      idPost: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_post'])!,
      qty: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}qty'])!,
      isLike: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_like'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_user'] = Variable<String>(idUser);
    map['id_post'] = Variable<String>(idPost);
    map['qty'] = Variable<int>(qty);
    map['is_like'] = Variable<bool>(isLike);
    return map;
  }

  PostTableCompanion toCompanion(bool nullToAbsent) {
    return PostTableCompanion(
      id: Value(id),
      idUser: Value(idUser),
      idPost: Value(idPost),
      qty: Value(qty),
      isLike: Value(isLike),
    );
  }

  factory PostTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PostTableData(
      id: serializer.fromJson<int>(json['id']),
      idUser: serializer.fromJson<String>(json['idUser']),
      idPost: serializer.fromJson<String>(json['idPost']),
      qty: serializer.fromJson<int>(json['qty']),
      isLike: serializer.fromJson<bool>(json['isLike']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idUser': serializer.toJson<String>(idUser),
      'idPost': serializer.toJson<String>(idPost),
      'qty': serializer.toJson<int>(qty),
      'isLike': serializer.toJson<bool>(isLike),
    };
  }

  PostTableData copyWith(
          {int? id, String? idUser, String? idPost, int? qty, bool? isLike}) =>
      PostTableData(
        id: id ?? this.id,
        idUser: idUser ?? this.idUser,
        idPost: idPost ?? this.idPost,
        qty: qty ?? this.qty,
        isLike: isLike ?? this.isLike,
      );
  @override
  String toString() {
    return (StringBuffer('PostTableData(')
          ..write('id: $id, ')
          ..write('idUser: $idUser, ')
          ..write('idPost: $idPost, ')
          ..write('qty: $qty, ')
          ..write('isLike: $isLike')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, idUser, idPost, qty, isLike);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PostTableData &&
          other.id == this.id &&
          other.idUser == this.idUser &&
          other.idPost == this.idPost &&
          other.qty == this.qty &&
          other.isLike == this.isLike);
}

class PostTableCompanion extends UpdateCompanion<PostTableData> {
  final Value<int> id;
  final Value<String> idUser;
  final Value<String> idPost;
  final Value<int> qty;
  final Value<bool> isLike;
  const PostTableCompanion({
    this.id = const Value.absent(),
    this.idUser = const Value.absent(),
    this.idPost = const Value.absent(),
    this.qty = const Value.absent(),
    this.isLike = const Value.absent(),
  });
  PostTableCompanion.insert({
    this.id = const Value.absent(),
    required String idUser,
    required String idPost,
    required int qty,
    this.isLike = const Value.absent(),
  })  : idUser = Value(idUser),
        idPost = Value(idPost),
        qty = Value(qty);
  static Insertable<PostTableData> custom({
    Expression<int>? id,
    Expression<String>? idUser,
    Expression<String>? idPost,
    Expression<int>? qty,
    Expression<bool>? isLike,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idUser != null) 'id_user': idUser,
      if (idPost != null) 'id_post': idPost,
      if (qty != null) 'qty': qty,
      if (isLike != null) 'is_like': isLike,
    });
  }

  PostTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? idUser,
      Value<String>? idPost,
      Value<int>? qty,
      Value<bool>? isLike}) {
    return PostTableCompanion(
      id: id ?? this.id,
      idUser: idUser ?? this.idUser,
      idPost: idPost ?? this.idPost,
      qty: qty ?? this.qty,
      isLike: isLike ?? this.isLike,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idUser.present) {
      map['id_user'] = Variable<String>(idUser.value);
    }
    if (idPost.present) {
      map['id_post'] = Variable<String>(idPost.value);
    }
    if (qty.present) {
      map['qty'] = Variable<int>(qty.value);
    }
    if (isLike.present) {
      map['is_like'] = Variable<bool>(isLike.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PostTableCompanion(')
          ..write('id: $id, ')
          ..write('idUser: $idUser, ')
          ..write('idPost: $idPost, ')
          ..write('qty: $qty, ')
          ..write('isLike: $isLike')
          ..write(')'))
        .toString();
  }
}

class $PostTableTable extends PostTable
    with TableInfo<$PostTableTable, PostTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PostTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _idUserMeta = const VerificationMeta('idUser');
  @override
  late final GeneratedColumn<String?> idUser = GeneratedColumn<String?>(
      'id_user', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _idPostMeta = const VerificationMeta('idPost');
  @override
  late final GeneratedColumn<String?> idPost = GeneratedColumn<String?>(
      'id_post', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _qtyMeta = const VerificationMeta('qty');
  @override
  late final GeneratedColumn<int?> qty = GeneratedColumn<int?>(
      'qty', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _isLikeMeta = const VerificationMeta('isLike');
  @override
  late final GeneratedColumn<bool?> isLike = GeneratedColumn<bool?>(
      'is_like', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_like IN (0, 1))',
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [id, idUser, idPost, qty, isLike];
  @override
  String get aliasedName => _alias ?? 'post_table';
  @override
  String get actualTableName => 'post_table';
  @override
  VerificationContext validateIntegrity(Insertable<PostTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_user')) {
      context.handle(_idUserMeta,
          idUser.isAcceptableOrUnknown(data['id_user']!, _idUserMeta));
    } else if (isInserting) {
      context.missing(_idUserMeta);
    }
    if (data.containsKey('id_post')) {
      context.handle(_idPostMeta,
          idPost.isAcceptableOrUnknown(data['id_post']!, _idPostMeta));
    } else if (isInserting) {
      context.missing(_idPostMeta);
    }
    if (data.containsKey('qty')) {
      context.handle(
          _qtyMeta, qty.isAcceptableOrUnknown(data['qty']!, _qtyMeta));
    } else if (isInserting) {
      context.missing(_qtyMeta);
    }
    if (data.containsKey('is_like')) {
      context.handle(_isLikeMeta,
          isLike.isAcceptableOrUnknown(data['is_like']!, _isLikeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PostTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PostTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PostTableTable createAlias(String alias) {
    return $PostTableTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $FriendsTableTable friendsTable = $FriendsTableTable(this);
  late final $PostTableTable postTable = $PostTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [friendsTable, postTable];
}
