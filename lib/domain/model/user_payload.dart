import 'package:m_tinder/domain/model/model.dart';

class UserPayload {
  List<UserModel>? users;
  int? total;
  int? page;
  int? limit;

  UserPayload({this.users, this.total, this.page, this.limit});

  UserPayload.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      users = <UserModel>[];
      json['data'].forEach((v) {
        users!.add(UserModel.fromJson(v));
      });
    }
    total = json['total'];
    page = json['page'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.users != null) {
      data['data'] = this.users!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['page'] = this.page;
    data['limit'] = this.limit;
    return data;
  }
}
