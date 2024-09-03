import 'package:json_annotation/json_annotation.dart';

part 'create_work_place_param.g.dart';

@JsonSerializable()
class CreateWorkPlaceParam {
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

  const CreateWorkPlaceParam({
    required this.name,
    required this.city,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.radius,
  });

  factory CreateWorkPlaceParam.fromJson(Map<String, dynamic> json) => _$CreateWorkPlaceParamFromJson(json);

  Map<String, dynamic> toJson() => _$CreateWorkPlaceParamToJson(this);
}
