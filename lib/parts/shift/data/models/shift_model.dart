import 'package:json_annotation/json_annotation.dart';
import 'package:personnel_management/parts/shift/domain/entities/shift_entity.dart';

part 'shift_model.g.dart';

@JsonSerializable()
class ShiftModel {
  final String sampleField;

  const ShiftModel({
    required this.sampleField,
  });

  factory ShiftModel.fromEntity(ShiftEntity entity) => ShiftModel(
        sampleField: entity.sampleField,
      );

  factory ShiftModel.fromJson(Map<String, dynamic> json) => _$ShiftModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShiftModelToJson(this);

  ShiftEntity toEntity() {
    return ShiftEntity(
      sampleField: sampleField,
    );
  }
}
