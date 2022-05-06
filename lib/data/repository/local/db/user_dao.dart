import 'package:m_tinder/data/repository/local/db/table/user_table.dart';
import 'package:moor_flutter/moor_flutter.dart';

import 'app_database.dart';

part 'user_dao.g.dart';

@UseDao(tables: [UserTable])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(AppDatabase db) : super(db);

  Future like(UserTableData user) {
    return into(userTable).insert(user.copyWith(status: 'like'), mode: InsertMode.insertOrReplace);
  }

  Future updateUser(UserTableData user) {
    return into(userTable).insert(user.copyWith(dateOfbirth: user.dateOfbirth), mode: InsertMode.insertOrReplace);
  }

  Future<UserTableData> getUserById(String userId) {
    return (select(userTable)..where((l) => l.id.equals(userId))).getSingle();
  }

  Future ignore(UserTableData user) =>
      into(userTable).insert(user.copyWith(status: 'ignore'), mode: InsertMode.insertOrReplace);

  Future<List<UserTableData>> getAll() => select(userTable).get();

  Stream<List<UserTableData>> allLiked() {
    return (select(userTable)..where((bp) => bp.status.equals('like'))).watch();
  }

  Stream<List<UserTableData>> allIgnored() {
    return (select(userTable)..where((bp) => bp.status.equals('ignore'))).watch();
  }
}
