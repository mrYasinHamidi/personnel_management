
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:personnel_management/core/converters/time_converter.dart';

part 'edit_shift_param.g.dart';

@JsonSerializable()
class EditShiftParam {
  @JsonKey(name: '_id')
  final String id;

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

  const EditShiftParam({
    required this.id,
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.floatTime,
  });

  factory EditShiftParam.fromJson(Map<String, dynamic> json) => _$EditShiftParamFromJson(json);

  Map<String, dynamic> toJson() => _$EditShiftParamToJson(this);
}
