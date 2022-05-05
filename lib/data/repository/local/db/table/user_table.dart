import 'package:m_tinder/data/repository/local/db/app_database.dart';
import 'package:m_tinder/data/util/base_mapper.dart';
import 'package:moor_flutter/moor_flutter.dart';

import '../../../../../domain/model/model.dart';

class UserTable extends Table {
  TextColumn get id => text().withLength(min: 1, max: 50).nullable()();

  TextColumn? get title => text().withLength(min: 1, max: 50).nullable()();

  TextColumn? get firstName => text().withLength(min: 1, max: 50).nullable()();

  TextColumn? get lastName => text().withLength(min: 1, max: 50).nullable()();

  TextColumn? get status => text().withLength(min: 1, max: 50).nullable()();

  TextColumn? get picture => text().withLength(min: 1, max: 200).nullable()();

  DateTimeColumn? get syncDate => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class UserTableMapper extends BaseDTOMapper<UserTableData, UserModel> {
  @override
  UserTableData mapToDTO(UserModel entity) {
    return UserTableData(
      id: entity.id,
      title: entity.title,
      firstName: entity.firstName,
      lastName: entity.lastName,
      status: entity.status,
      syncDate: entity.syncDate,
      picture: entity.picture
    );
  }

  @override
  UserModel mapToEntity(UserTableData dto) {
    return UserModel(
      id: dto.id,
      title: dto.title,
      firstName: dto.firstName,
      lastName: dto.lastName,
      status: dto.status,
      syncDate: dto.syncDate,
      picture: dto.picture
    );
  }
}
