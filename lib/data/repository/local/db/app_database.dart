import 'package:m_tinder/data/repository/local/db/table/user_table.dart';
import 'package:m_tinder/data/repository/local/db/user_dao.dart';
import 'package:moor_flutter/moor_flutter.dart';
part 'app_database.g.dart';

@UseMoor(tables: [UserTable],daos: [UserDao])
// _$AppDatabase is the name of the generated class
class AppDatabase extends _$AppDatabase {
  AppDatabase()
  // Specify the location of the database file
      : super((FlutterQueryExecutor.inDatabaseFolder(
    path: 'db.sqlite',
    // Good for debugging - prints SQL in the console
    logStatements: true,
  )));

  // Bump this when changing tables and columns.
  // Migrations will be covered in the next part.
  @override
  int get schemaVersion => 1;
}