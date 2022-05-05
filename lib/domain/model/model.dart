import 'package:m_tinder/data/repository/local/db/app_database.dart';

class UserModel {
  String? id;
  String? title;
  String? firstName;
  String? lastName;
  String? picture;
  String? status;
  DateTime? syncDate;

  UserModel({this.id, this.title, this.firstName, this.lastName, this.picture, this.syncDate, this.status});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    title = json['title'] as String?;
    firstName = json['firstName'] as String?;
    lastName = json['lastName'] as String?;
    picture = json['picture'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['title'] = title;
    json['firstName'] = firstName;
    json['lastName'] = lastName;
    json['picture'] = picture;
    return json;
  }

  @override
  String toString() {
    return 'UserModel{id: $id, title: $title, firstName: $firstName, lastName: $lastName, picture: $picture}';
  }

  UserTableData toTable() {
    return UserTableData(
      id: '$id',
      lastName: '$lastName',
      firstName: '$firstName',
      status: '$status',
      title: '$title',
      picture: picture
    );
  }
}
