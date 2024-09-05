import 'package:json_annotation/json_annotation.dart';

part 'get_work_place_list_param.g.dart';

@JsonSerializable()
class GetWorkPlaceListParam {
  @JsonKey(name: 'paginate')
  final bool paginate;

  @JsonKey(name: 'page')
  final int page;

  @JsonKey(name: 'limit')
  final int limit;

  const GetWorkPlaceListParam({
    this.paginate = true,
    required this.page,
    required this.limit,
  });

  factory GetWorkPlaceListParam.fromJson(Map<String, dynamic> json) => _$GetWorkPlaceListParamFromJson(json);

  Map<String, dynamic> toJson() => _$GetWorkPlaceListParamToJson(this);
}
