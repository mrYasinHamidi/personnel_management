import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:personnel_management/common/entities/user_entity.dart';
import 'package:personnel_management/common/enums/user_role.dart';

part 'user_model.g.dart';

@JsonSerializable()
class PersonnelModel extends Equatable {
  @JsonKey(name: '_id')
  final String id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'username')
  final String username;

  @JsonKey(name: 'managerId')
  final String managerId;

  @JsonKey(name: 'personnelCode')
  final int personnelCode;

  @JsonKey(name: 'createdAt')
  final DateTime createdAt;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'nationalCode')
  final String nationalCode;

  @JsonKey(name: 'role')
  final UserRole role;

  @JsonKey(name: 'workStartDate')
  final DateTime workStartDate;

  @JsonKey(name: 'workEndDate')
  final DateTime workEndDate;

  const PersonnelModel({
    required this.id,
    required this.name,
    required this.username,
    required this.managerId,
    required this.personnelCode,
    required this.createdAt,
    required this.email,
    required this.nationalCode,
    required this.role,
    required this.workStartDate,
    required this.workEndDate,
  });

  factory PersonnelModel.fromJson(Map<String, dynamic> json) => _$PersonnelModelFromJson(json);

  Map<String, dynamic> toJson() => _$PersonnelModelToJson(this);

  PersonnelEntity toEntity() {
    return PersonnelEntity(
      id: id,
      name: name,
      createdAt: createdAt,
      email: email,
      nationalCode: nationalCode,
      role: role,
      workStartDate: workStartDate,
      workEndDate: workEndDate,
      username: username,
      managerId: managerId,
      personnelCode: personnelCode,
    );
  }

  @override
  List<Object?> get props => [id];
}

@JsonSerializable()
class ManagerModel extends Equatable {
  @JsonKey(name: '_id')
  final String id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'phone')
  final String phone;

  @JsonKey(name: 'createdAt')
  final DateTime createdAt;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'nationalCode')
  final String nationalCode;

  @JsonKey(name: 'role')
  final UserRole role;

  const ManagerModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.createdAt,
    required this.email,
    required this.nationalCode,
    required this.role,
  });

  factory ManagerModel.fromJson(Map<String, dynamic> json) => _$ManagerModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManagerModelToJson(this);

  ManagerEntity toEntity() {
    return ManagerEntity(
      id: id,
      name: name,
      createdAt: createdAt,
      phone: phone,
      email: email,
      nationalCode: nationalCode,
      role: role,
    );
  }

  @override
  List<Object?> get props => [id];
}
