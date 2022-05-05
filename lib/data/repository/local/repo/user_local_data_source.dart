import 'package:get/get.dart';
import 'package:m_tinder/data/repository/local/db/app_database.dart';
import 'package:m_tinder/data/repository/local/db/table/user_table.dart';

import '../../../../domain/model/model.dart';


class UserCacheRepo {
  final AppDatabase _appDatabase = Get.find<AppDatabase>();

  Future<List<UserModel>> getUsers() {
    throw UnimplementedError();
  }

  Future<dynamic> like(UserModel userModel) async {
    return _appDatabase.userDao.like(userModel.toTable());
  }

  Future<dynamic> ignore(UserModel userModel) async {
    return _appDatabase.userDao.ignore(userModel.toTable());
  }

  Stream<List<UserModel>> getLiked() {
    return _appDatabase.userDao.allLiked().map((event) => UserTableMapper().mapToEntities(event));
  }

  Stream<List<UserModel>> getIgnored() {
    return _appDatabase.userDao.allIgnored().map((event) => UserTableMapper().mapToEntities(event));
  }
}
