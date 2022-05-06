import 'package:m_tinder/domain/model/user_payload.dart';

import '../model/model.dart';

abstract class UserRepo {
  Future<List<UserModel>> getUsers();

  Future<UserPayload> getUserPayload(int currentPage);

  Future<UserModel> getUserDetail(String userId);

  Stream<List<UserModel>> getLikedUsers();

  Stream<List<UserModel>> getIgnoreUsers();

  Future<dynamic> like(UserModel user);

  Future<dynamic> ignore(UserModel user);
}
