// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class UserTableData extends DataClass implements Insertable<UserTableData> {
  final String? id;
  final String? title;
  final String? firstName;
  final String? lastName;
  final String? status;
  final String? picture;
  final String? dateOfbirth;
  final DateTime? syncDate;
  UserTableData(
      {this.id,
      this.title,
      this.firstName,
      this.lastName,
      this.status,
      this.picture,
      this.dateOfbirth,
      this.syncDate});
  factory UserTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return UserTableData(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title']),
      firstName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}first_name']),
      lastName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name']),
      status: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status']),
      picture: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}picture']),
      dateOfbirth: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date_ofbirth']),
      syncDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sync_date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String?>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String?>(title);
    }
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String?>(firstName);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String?>(lastName);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String?>(status);
    }
    if (!nullToAbsent || picture != null) {
      map['picture'] = Variable<String?>(picture);
    }
    if (!nullToAbsent || dateOfbirth != null) {
      map['date_ofbirth'] = Variable<String?>(dateOfbirth);
    }
    if (!nullToAbsent || syncDate != null) {
      map['sync_date'] = Variable<DateTime?>(syncDate);
    }
    return map;
  }

  UserTableCompanion toCompanion(bool nullToAbsent) {
    return UserTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      picture: picture == null && nullToAbsent
          ? const Value.absent()
          : Value(picture),
      dateOfbirth: dateOfbirth == null && nullToAbsent
          ? const Value.absent()
          : Value(dateOfbirth),
      syncDate: syncDate == null && nullToAbsent
          ? const Value.absent()
          : Value(syncDate),
    );
  }

  factory UserTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return UserTableData(
      id: serializer.fromJson<String?>(json['id']),
      title: serializer.fromJson<String?>(json['title']),
      firstName: serializer.fromJson<String?>(json['firstName']),
      lastName: serializer.fromJson<String?>(json['lastName']),
      status: serializer.fromJson<String?>(json['status']),
      picture: serializer.fromJson<String?>(json['picture']),
      dateOfbirth: serializer.fromJson<String?>(json['dateOfbirth']),
      syncDate: serializer.fromJson<DateTime?>(json['syncDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'title': serializer.toJson<String?>(title),
      'firstName': serializer.toJson<String?>(firstName),
      'lastName': serializer.toJson<String?>(lastName),
      'status': serializer.toJson<String?>(status),
      'picture': serializer.toJson<String?>(picture),
      'dateOfbirth': serializer.toJson<String?>(dateOfbirth),
      'syncDate': serializer.toJson<DateTime?>(syncDate),
    };
  }

  UserTableData copyWith(
          {String? id,
          String? title,
          String? firstName,
          String? lastName,
          String? status,
          String? picture,
          String? dateOfbirth,
          DateTime? syncDate}) =>
      UserTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        status: status ?? this.status,
        picture: picture ?? this.picture,
        dateOfbirth: dateOfbirth ?? this.dateOfbirth,
        syncDate: syncDate ?? this.syncDate,
      );
  @override
  String toString() {
    return (StringBuffer('UserTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('status: $status, ')
          ..write('picture: $picture, ')
          ..write('dateOfbirth: $dateOfbirth, ')
          ..write('syncDate: $syncDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, title, firstName, lastName, status, picture, dateOfbirth, syncDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.status == this.status &&
          other.picture == this.picture &&
          other.dateOfbirth == this.dateOfbirth &&
          other.syncDate == this.syncDate);
}

class UserTableCompanion extends UpdateCompanion<UserTableData> {
  final Value<String?> id;
  final Value<String?> title;
  final Value<String?> firstName;
  final Value<String?> lastName;
  final Value<String?> status;
  final Value<String?> picture;
  final Value<String?> dateOfbirth;
  final Value<DateTime?> syncDate;
  const UserTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.status = const Value.absent(),
    this.picture = const Value.absent(),
    this.dateOfbirth = const Value.absent(),
    this.syncDate = const Value.absent(),
  });
  UserTableCompanion.insert({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.status = const Value.absent(),
    this.picture = const Value.absent(),
    this.dateOfbirth = const Value.absent(),
    this.syncDate = const Value.absent(),
  });
  static Insertable<UserTableData> custom({
    Expression<String?>? id,
    Expression<String?>? title,
    Expression<String?>? firstName,
    Expression<String?>? lastName,
    Expression<String?>? status,
    Expression<String?>? picture,
    Expression<String?>? dateOfbirth,
    Expression<DateTime?>? syncDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (status != null) 'status': status,
      if (picture != null) 'picture': picture,
      if (dateOfbirth != null) 'date_ofbirth': dateOfbirth,
      if (syncDate != null) 'sync_date': syncDate,
    });
  }

  UserTableCompanion copyWith(
      {Value<String?>? id,
      Value<String?>? title,
      Value<String?>? firstName,
      Value<String?>? lastName,
      Value<String?>? status,
      Value<String?>? picture,
      Value<String?>? dateOfbirth,
      Value<DateTime?>? syncDate}) {
    return UserTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      status: status ?? this.status,
      picture: picture ?? this.picture,
      dateOfbirth: dateOfbirth ?? this.dateOfbirth,
      syncDate: syncDate ?? this.syncDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String?>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String?>(title.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String?>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String?>(lastName.value);
    }
    if (status.present) {
      map['status'] = Variable<String?>(status.value);
    }
    if (picture.present) {
      map['picture'] = Variable<String?>(picture.value);
    }
    if (dateOfbirth.present) {
      map['date_ofbirth'] = Variable<String?>(dateOfbirth.value);
    }
    if (syncDate.present) {
      map['sync_date'] = Variable<DateTime?>(syncDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('status: $status, ')
          ..write('picture: $picture, ')
          ..write('dateOfbirth: $dateOfbirth, ')
          ..write('syncDate: $syncDate')
          ..write(')'))
        .toString();
  }
}

class $UserTableTable extends UserTable
    with TableInfo<$UserTableTable, UserTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _firstNameMeta = const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String?> firstName = GeneratedColumn<String?>(
      'first_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _lastNameMeta = const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String?> lastName = GeneratedColumn<String?>(
      'last_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String?> status = GeneratedColumn<String?>(
      'status', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _pictureMeta = const VerificationMeta('picture');
  @override
  late final GeneratedColumn<String?> picture = GeneratedColumn<String?>(
      'picture', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 200),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _dateOfbirthMeta =
      const VerificationMeta('dateOfbirth');
  @override
  late final GeneratedColumn<String?> dateOfbirth = GeneratedColumn<String?>(
      'date_ofbirth', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 200),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _syncDateMeta = const VerificationMeta('syncDate');
  @override
  late final GeneratedColumn<DateTime?> syncDate = GeneratedColumn<DateTime?>(
      'sync_date', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, firstName, lastName, status, picture, dateOfbirth, syncDate];
  @override
  String get aliasedName => _alias ?? 'user_table';
  @override
  String get actualTableName => 'user_table';
  @override
  VerificationContext validateIntegrity(Insertable<UserTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('picture')) {
      context.handle(_pictureMeta,
          picture.isAcceptableOrUnknown(data['picture']!, _pictureMeta));
    }
    if (data.containsKey('date_ofbirth')) {
      context.handle(
          _dateOfbirthMeta,
          dateOfbirth.isAcceptableOrUnknown(
              data['date_ofbirth']!, _dateOfbirthMeta));
    }
    if (data.containsKey('sync_date')) {
      context.handle(_syncDateMeta,
          syncDate.isAcceptableOrUnknown(data['sync_date']!, _syncDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return UserTableData.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $UserTableTable createAlias(String alias) {
    return $UserTableTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $UserTableTable userTable = $UserTableTable(this);
  late final UserDao userDao = UserDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [userTable];
}
