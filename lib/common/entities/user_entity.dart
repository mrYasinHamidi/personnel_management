import 'package:equatable/equatable.dart';
import 'package:personnel_management/common/enums/user_role.dart';

sealed class UserEntity extends Equatable {
  final String id;
  final String name;
  final DateTime createdAt;
  final String nationalCode;

  const UserEntity({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.nationalCode,
  });

  @override
  List<Object?> get props => [id];
}

class ManagerEntity extends UserEntity {
  final String phone;
  final String email;

  const ManagerEntity({
    required super.id,
    required super.name,
    required super.createdAt,
    required this.phone,
    required this.email,
    required super.nationalCode,
  });
}

class PersonnelEntity extends UserEntity {
  final int personnelCode;
  final DateTime workStartDate;
  final DateTime workEndDate;
  final String username;
  final String managerId;

  const PersonnelEntity({
    required super.id,
    required super.name,
    required super.createdAt,
    required super.nationalCode,
    required this.workStartDate,
    required this.workEndDate,
    required this.username,
    required this.managerId,
    required this.personnelCode,
  });
}
