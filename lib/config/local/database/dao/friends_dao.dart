import 'package:drift/drift.dart';
import 'package:logique/config/local/database/database_module.dart';
import 'package:logique/config/local/database/table/friends_table.dart';

part 'friends_dao.g.dart';

@DriftAccessor(tables: [FriendsTable])
class FriendsDao extends DatabaseAccessor<AppDatabase> with _$FriendsDaoMixin {
  FriendsDao(AppDatabase db) : super(db);

  // Future<void> saveFriends(ProductDetailTableCompanion data) =>
  //     into(friendsTable).insert(data, mode: InsertMode.insertOrReplace);
  //
  // Future<void> deleteProduct(String productUrl) => (delete(productDetailTable)
  //   ..where((tbl) => tbl.imageUrl.equals(productUrl)))
  //     .go();
  //
  // Future<ProductDetailTableData> getFavoriteProductByUrl(String productUrl) =>
  //     (select(productDetailTable)
  //       ..where((tbl) => tbl.imageUrl.equals(productUrl)))
  //         .getSingle();
  //
  // Future<List<ProductDetailTableData>> getFavoriteProducts() =>
  //     select(productDetailTable).get();
}