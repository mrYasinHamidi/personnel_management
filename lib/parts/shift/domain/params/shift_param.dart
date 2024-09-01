
import 'package:json_annotation/json_annotation.dart';
part 'shift_param.g.dart';
@JsonSerializable()
class ShiftParam {

  @JsonKey(name: 'sampleField')
  final String sampleField;

  const ShiftParam({
    required this.sampleField,
  });

  factory ShiftParam.fromJson(Map<String, dynamic> json) => _$ShiftParamFromJson(json);

  Map<String, dynamic> toJson() => _$ShiftParamToJson(this);
}

