import 'package:dio/dio.dart';
import 'package:m_tinder/domain/model/user_payload.dart';

import '../../../domain/model/model.dart';

class UserRemoteRepo {
  final Dio dio = Dio()..options.headers.addAll({'app-id': '6162b45dbca1e4470c339c6a'});

  Future<List<UserModel>> getUsers() async {
    return [];
  }

  Future<UserPayload> getUserPayload(int curentPage) async {
    var response = await dio.get('https://dummyapi.io/data/v1/user?limit=10&page=$curentPage');
    return UserPayload.fromJson(response.data);
  }
}
