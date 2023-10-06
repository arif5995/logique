
import 'package:drift/drift.dart';
import 'package:drift_sqflite/drift_sqflite.dart';
import 'package:logique/config/local/database/table/friends_table.dart';
import 'package:logique/config/local/database/table/post_table.dart';

part 'database_module.g.dart';

@DriftDatabase(
  tables: [FriendsTable, PostTable],
  // daos: [ProductDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

QueryExecutor _openConnection() {
  return SqfliteQueryExecutor.inDatabaseFolder(
    path: 'db.sqlite',
    logStatements: true,
  );
}