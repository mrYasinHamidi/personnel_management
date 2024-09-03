import 'package:json_annotation/json_annotation.dart';
import 'package:personnel_management/parts/shift/domain/entities/shift_entity.dart';

part 'shift_model.g.dart';

@JsonSerializable()
class ShiftModel extends ShiftEntity {
  @JsonKey(name: '_id')
  final String _id;

  @JsonKey(name: 'name')
  final String _name;

  @JsonKey(name: 'startTime')
  final String _startTime;

  @JsonKey(name: 'endTime')
  final String _endTime;

  @JsonKey(name: 'floatTime')
  final int? _floatTime;

  const ShiftModel(
    this._id,
    this._name,
    this._startTime,
    this._endTime,
    this._floatTime,
  ) : super(
          id: _id,
          startTime: _startTime,
          floatTime: _floatTime,
          endTime: _endTime,
          name: _name,
        );

  factory ShiftModel.fromJson(Map<String, dynamic> json) => _$ShiftModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShiftModelToJson(this);
}
