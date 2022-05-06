import 'package:get/get.dart';
import 'package:m_tinder/data/repository/remote/user_remote_data_source.dart';
import 'package:m_tinder/domain/model/user_payload.dart';
import 'package:m_tinder/domain/repo/user_repo.dart';

import '../../../domain/model/model.dart';
import '../local/repo/user_local_data_source.dart';

class UserRepositoryImpl implements UserRepo {
  final _remoteRepo = UserRemoteRepo();
  final UserCacheRepo _cacheRepo = Get.find<UserCacheRepo>();

  @override
  Future<List<UserModel>> getUsers() {
    return _remoteRepo.getUsers();
  }

  @override
  Future<UserPayload> getUserPayload(int currentPage) {
    return _remoteRepo.getUserPayload(currentPage);
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
    return _cacheRepo.getIgnored();
  }

  @override
  Stream<List<UserModel>> getLikedUsers() {
    return _cacheRepo.getLiked();
  }

  @override
  Future<UserModel> getUserDetail(String userId) async {
    try {
      var localData = await _cacheRepo.getUserById(userId);
      if (localData.dateOfBirth != null && localData.dateOfBirth.isBlank != true) {
        return localData;
      } else {
        var result = await _remoteRepo.getUserDetail(userId);
        _cacheRepo.saveUer(result.toTable());
        return result;
      }
    } catch (e) {
      var result = await _remoteRepo.getUserDetail(userId);
      _cacheRepo.saveUer(result.toTable());
      return result;
    }
  }
}
