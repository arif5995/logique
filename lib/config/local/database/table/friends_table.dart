import 'package:drift/drift.dart';

class FriendsTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get idUser => text()();

  TextColumn get nameUser => text()();

  BoolColumn get isFriends =>
      boolean().named("is_friends").withDefault(const Constant(false))();
}
