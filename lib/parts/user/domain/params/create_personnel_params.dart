import 'package:json_annotation/json_annotation.dart';

part 'create_personnel_params.g.dart';

@JsonSerializable()
class CreatePersonnelParams {
  @JsonKey(name: 'username')
  final String username;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'password')
  final String password;

  @JsonKey(name: 'passwordConfirm')
  final String passwordConfirm;

  @JsonKey(name: 'nationalCode')
  final String nationalCode;

  @JsonKey(name: 'personnelCode')
  final int personnelCode;

  @JsonKey(name: 'workStartDate')
  final DateTime workStartDate;

  @JsonKey(name: 'workEndDate')
  final DateTime workEndDate;

  const CreatePersonnelParams({
    required this.username,
    required this.name,
    required this.password,
    required this.passwordConfirm,
    required this.nationalCode,
    required this.personnelCode,
    required this.workStartDate,
    required this.workEndDate,
  });

  factory CreatePersonnelParams.fromJson(Map<String, dynamic> json) => _$CreatePersonnelParamsFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePersonnelParamsToJson(this);
}
