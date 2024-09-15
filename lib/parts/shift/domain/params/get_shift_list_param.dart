import 'package:json_annotation/json_annotation.dart';

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
