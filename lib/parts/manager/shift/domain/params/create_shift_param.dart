import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:personnel_management/core/converters/time_converter.dart';

part 'create_shift_param.g.dart';

@JsonSerializable()
class CreateShiftParam {
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'startTime')
  @TimeConverter()
  final TimeOfDay startTime;

  @JsonKey(name: 'endTime')
  @TimeConverter()
  final TimeOfDay endTime;

  @JsonKey(name: 'floatTime')
  @TimeConverter()
  final int? floatTime;

  const CreateShiftParam({
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.floatTime,
  });

  factory CreateShiftParam.fromJson(Map<String, dynamic> json) => _$CreateShiftParamFromJson(json);

  Map<String, dynamic> toJson() => _$CreateShiftParamToJson(this);
}
