import 'package:json_annotation/json_annotation.dart';

part 'login_param.g.dart';

@JsonSerializable()
class LoginParam {

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'password')
  final String password;

  const LoginParam({
    required this.email,
    required this.password,
  });

  factory LoginParam.fromJson(Map<String, dynamic> json) => _$LoginParamFromJson(json);

  Map<String, dynamic> toJson() => _$LoginParamToJson(this);
}
