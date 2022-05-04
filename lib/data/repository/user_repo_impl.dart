import 'package:get/get.dart';
import 'package:m_tinder/data/repository/remote/user_remote_data_source.dart';
import 'package:m_tinder/domain/user_repo.dart';
import 'package:m_tinder/model/model.dart';

import 'local/repo/user_local_data_source.dart';


class UserRepositoryImpl implements UserRepo {
  final _remoteRepo = UserRemoteRepo();
  UserCacheRepo _cacheRepo = Get.find<UserCacheRepo>();

  @override
  Future<List<UserModel>> getUsers() {
    return _remoteRepo.getUsers();
  }

  @override
  Future<dynamic> like(UserModel user) {
    return _cacheRepo.like(user);
  }

  @override
  Future<dynamic> ignore(UserModel user) {
    return _cacheRepo.ignore(user);
  }

  @override
  Stream<List<UserModel>> getIgnoreUsers() {
    return _cacheRepo.getLiked();
  }

  @override
  Stream<List<UserModel>> getLikedUsers() {
    return _cacheRepo.getIgnored();
  }
}
