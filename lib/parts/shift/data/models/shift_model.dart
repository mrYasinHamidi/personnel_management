import 'package:json_annotation/json_annotation.dart';
import 'package:personnel_management/parts/shift/domain/entities/shift_entity.dart';

part 'shift_model.g.dart';

@JsonSerializable()
class ShiftModel {
  @JsonKey(name: '_id')
  final String id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'startTime')
  final String startTime;

  @JsonKey(name: 'endTime')
  final String endTime;

  @JsonKey(name: 'floatTime')
  final int? floatTime;

  ShiftModel({
    required this.id,
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.floatTime,
  });

  factory ShiftModel.fromJson(Map<String, dynamic> json) => _$ShiftModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShiftModelToJson(this);

  ShiftEntity toEntity() {
    return ShiftEntity(
      id: id,
      name: name,
      startTime: startTime,
      endTime: endTime,
      floatTime: floatTime,
    );
  }
}
