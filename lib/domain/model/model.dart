import 'package:m_tinder/data/repository/local/db/app_database.dart';

class UserModel {
  String? id;
  String? title;
  String? firstName;
  String? lastName;
  String? picture;
  String? status;
  String? dateOfBirth;
  DateTime? syncDate;

  UserModel(
      {this.id, this.title, this.firstName, this.lastName, this.picture, this.syncDate, this.status, this.dateOfBirth});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    title = json['title'] as String?;
    firstName = json['firstName'] as String?;
    lastName = json['lastName'] as String?;
    picture = json['picture'] as String?;
    dateOfBirth = json['dateOfBirth'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['title'] = title;
    json['firstName'] = firstName;
    json['lastName'] = lastName;
    json['picture'] = picture;
    dateOfBirth = json['dateOfBirth'] as String?;
    return json;
  }

  String getAge() {
    try {
      return '${DateTime.now().year.toInt() - DateTime.parse('${dateOfBirth}').year.toInt()}';
    } catch (e) {
      return '';
    }
  }

  @override
  String toString() {
    return 'UserModel{id: $id, title: $title, firstName: $firstName, lastName: $lastName, picture: $picture, status: $status, dateOfBirth: $dateOfBirth, syncDate: $syncDate}';
  }

  UserTableData toTable() {
    return UserTableData(
        id: '$id',
        lastName: '$lastName',
        firstName: '$firstName',
        status: '$status',
        title: '$title',
        picture: picture,
        dateOfbirth: dateOfBirth);
  }
}
