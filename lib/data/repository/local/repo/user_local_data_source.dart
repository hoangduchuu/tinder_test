import 'package:get/get.dart';
import 'package:m_tinder/data/repository/local/db/app_database.dart';
import 'package:m_tinder/data/repository/local/db/table/user_table.dart';
import 'package:m_tinder/data/util/base_mapper.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../model/model.dart';

class UserCacheRepo {
  AppDatabase _isar = Get.find<AppDatabase>();

  Future<List<UserModel>> getUsers() {
    throw UnimplementedError();
  }

  Future<dynamic> like(UserModel userModel) async {
    return _isar.userDao.like(userModel.toTable());
  }

  Future<dynamic> ignore(UserModel userModel) async {
    return _isar.userDao.like(userModel.toTable());
  }

  Stream<List<UserModel>> getLiked() {
    return _isar.userDao.allLiked().map((event) => UserTableMapper().mapToEntities(event));
  }

  Stream<List<UserModel>> getIgnored() {
    return _isar.userDao.allIgnored().map((event) => UserTableMapper().mapToEntities(event));
  }
}
