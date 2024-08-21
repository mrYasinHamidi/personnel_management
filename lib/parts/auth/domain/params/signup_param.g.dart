// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupParam _$SignupParamFromJson(Map<String, dynamic> json) => SignupParam(
      email: json['email'] as String,
      password: json['password'] as String,
      passwordConfirm: json['password_confirm'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$SignupParamToJson(SignupParam instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'password': instance.password,
      'password_confirm': instance.passwordConfirm,
    };
