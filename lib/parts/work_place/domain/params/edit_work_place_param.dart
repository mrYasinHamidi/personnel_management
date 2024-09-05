import 'package:json_annotation/json_annotation.dart';

part 'edit_work_place_param.g.dart';

@JsonSerializable()
class EditWorkPlaceParam {
  @JsonKey(name: '_id')
  final String id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'city')
  final String city;

  @JsonKey(name: 'address')
  final String address;

  @JsonKey(name: 'longitude')
  final double longitude;

  @JsonKey(name: 'latitude')
  final double latitude;

  @JsonKey(name: 'radius')
  final int? radius;

  const EditWorkPlaceParam({
    required this.id,
    required this.name,
    required this.city,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.radius,
  });

  factory EditWorkPlaceParam.fromJson(Map<String, dynamic> json) => _$EditWorkPlaceParamFromJson(json);

  Map<String, dynamic> toJson() => _$EditWorkPlaceParamToJson(this);
}
