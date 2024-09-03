import 'package:json_annotation/json_annotation.dart';
import 'package:personnel_management/parts/work_place/domain/entities/work_place_entity.dart';

part 'work_place_model.g.dart';

@JsonSerializable()
class WorkPlaceModel {
  @JsonKey(name: '_id')
  final String id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'city')
  final String city;

  @JsonKey(name: 'longitude')
  final double longitude;

  @JsonKey(name: 'latitude')
  final double latitude;

  @JsonKey(name: 'radius')
  final int radius;

  const WorkPlaceModel({
    required this.id,
    required this.name,
    required this.city,
    required this.longitude,
    required this.latitude,
    required this.radius,
  });

  factory WorkPlaceModel.fromJson(Map<String, dynamic> json) => _$WorkPlaceModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkPlaceModelToJson(this);

  WorkPlaceEntity toEntity() {
    return WorkPlaceEntity(
      id: id,
      name: name,
      city: city,
      longitude: longitude,
      latitude: latitude,
      radius: radius,
    );
  }
}
