import 'package:json_annotation/json_annotation.dart';
part 'get_personnel_list_param.g.dart';

@JsonSerializable()
class GetPersonnelListParam {
  @JsonKey(name: 'paginate')
  final bool paginate;

  @JsonKey(name: 'page')
  final int page;

  @JsonKey(name: 'limit')
  final int limit;

  const GetPersonnelListParam({
    required this.page,
    required this.limit,
    this.paginate = true,
  });
  factory GetPersonnelListParam.fromJson(Map<String, dynamic> json) => _$GetPersonnelListParamFromJson(json);

  Map<String, dynamic> toJson() => _$GetPersonnelListParamToJson(this);

}
