import 'package:json_annotation/json_annotation.dart';

part 'signup_param.g.dart';

@JsonSerializable()
class SignupParam {
  final String name;
  final String email;
  final String phone;
  final String password;

  const SignupParam({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
  });

  factory SignupParam.fromJson(Map<String, dynamic> json) => _$SignupParamFromJson(json);

  Map<String, dynamic> toJson() => _$SignupParamToJson(this);
}
