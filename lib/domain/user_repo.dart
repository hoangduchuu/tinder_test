import 'package:m_tinder/model/model.dart';

abstract class UserRepo {
  Future<List<UserModel>> getUsers();

  Stream<List<UserModel>> getLikedUsers();

  Stream<List<UserModel>> getIgnoreUsers();

  Future<dynamic> like(UserModel user);

  Future<dynamic> ignore(UserModel user);
}
