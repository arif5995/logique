import 'package:drift/drift.dart';

class PostTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get idUser => text()();

  TextColumn get idPost => text()();

  IntColumn get qty => integer()();

  BoolColumn get isLike =>
      boolean().named("is_like").withDefault(const Constant(false))();
}