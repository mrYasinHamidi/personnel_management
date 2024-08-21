import 'package:json_annotation/json_annotation.dart';

part 'signup_param.g.dart';

@JsonSerializable()
class SignupParam {
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'phone')
  final String phone;

  @JsonKey(name: 'password')
  final String password;

  @JsonKey(name: 'password_confirm')
  final String passwordConfirm;

  const SignupParam({
    required this.email,
    required this.password,
    required this.passwordConfirm,
    required this.name,
    required this.phone,
  });

  factory SignupParam.fromJson(Map<String, dynamic> json) => _$SignupParamFromJson(json);

  Map<String, dynamic> toJson() => _$SignupParamToJson(this);
}
