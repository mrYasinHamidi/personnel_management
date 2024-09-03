import 'package:equatable/equatable.dart';

class WorkPlaceEntity extends Equatable {
  final String id;
  final String name;
  final String city;
  final double longitude;
  final double latitude;
  final int radius;

  const WorkPlaceEntity({
    required this.id,
    required this.name,
    required this.city,
    required this.longitude,
    required this.latitude,
    required this.radius,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
