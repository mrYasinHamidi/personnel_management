import 'package:json_annotation/json_annotation.dart';

part 'signup_param.g.dart';

@JsonSerializable()
class SignupParam {
  final String email;
  final String password;

  const SignupParam({
    required this.email,
    required this.password,
  });

  factory SignupParam.fromJson(Map<String, dynamic> json) => _$SignupParamFromJson(json);

  Map<String, dynamic> toJson() => _$SignupParamToJson(this);
}
