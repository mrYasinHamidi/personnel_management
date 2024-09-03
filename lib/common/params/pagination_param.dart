import 'package:json_annotation/json_annotation.dart';

part 'pagination_param.g.dart';

@JsonSerializable()
class PaginationParam {
  @JsonKey(name: 'page')
  final int page;

  @JsonKey(name: 'limit')
  final int limit;

  @JsonKey(name: 'paginate')
  final bool paginate = true;

  const PaginationParam({
    required this.limit,
    required this.page,
  });

  factory PaginationParam.fromJson(Map<String, dynamic> json) => _$PaginationParamFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationParamToJson(this);
}
