import 'package:json_annotation/json_annotation.dart';

part 'edit_personnel_params.g.dart';

@JsonSerializable()
class EditPersonnelParams {
  @JsonKey(name: '_id')
  final String id;
  @JsonKey(name: 'username')
  final String username;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'password')
  final String? password;

  @JsonKey(name: 'passwordConfirm')
  final String? passwordConfirm;

  @JsonKey(name: 'nationalCode')
  final String nationalCode;

  @JsonKey(name: 'personnelCode')
  final int personnelCode;

  @JsonKey(name: 'workStartDate')
  final DateTime workStartDate;

  @JsonKey(name: 'workEndDate')
  final DateTime workEndDate;

  const EditPersonnelParams({
    required this.id,
    required this.username,
    required this.name,
    this.password,
    this.passwordConfirm,
    required this.nationalCode,
    required this.personnelCode,
    required this.workStartDate,
    required this.workEndDate,
  });

  factory EditPersonnelParams.fromJson(Map<String, dynamic> json) => _$EditPersonnelParamsFromJson(json);

  Map<String, dynamic> toJson() => _$EditPersonnelParamsToJson(this);
}
