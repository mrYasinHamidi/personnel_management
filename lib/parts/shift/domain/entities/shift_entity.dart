
import 'package:equatable/equatable.dart';

class ShiftEntity extends Equatable {
  
  final String sampleField;

  const ShiftEntity({
    required this.sampleField,
  });

  @override
  List<Object?> get props => [
        sampleField,
      ];
  
}
