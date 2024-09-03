import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:personnel_management/common/constants.dart';
import 'package:personnel_management/core/converters/time_converter.dart';

part 'get_shift_list_param.g.dart';

@JsonSerializable()
class GetShiftListParam {
  @JsonKey(name: 'paginate')
  final bool paginate;

  @JsonKey(name: 'page')
  final int page;

  @JsonKey(name: 'limit')
  final int limit;

  const GetShiftListParam({
    required this.page,
    required this.limit,
    this.paginate = true,
  });
  factory GetShiftListParam.fromJson(Map<String, dynamic> json) => _$GetShiftListParamFromJson(json);

  Map<String, dynamic> toJson() => _$GetShiftListParamToJson(this);

}
