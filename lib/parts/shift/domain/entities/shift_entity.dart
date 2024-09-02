import 'package:equatable/equatable.dart';

class ShiftEntity extends Equatable {
  final String id;
  final String name;
  final String startTime;
  final String endTime;
  final int? floatTime;

  const ShiftEntity({
    required this.id,
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.floatTime,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
