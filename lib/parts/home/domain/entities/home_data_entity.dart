import 'package:equatable/equatable.dart';

sealed class HomeDataEntity extends Equatable {
  const HomeDataEntity();
}

class ManagerHomeDataEntity extends HomeDataEntity {
  final int personnelCount;
  final int absencesCount;
  final int absenteesCount;
  final List absences;
  final List absentees;

  const ManagerHomeDataEntity({
    required this.personnelCount,
    required this.absencesCount,
    required this.absenteesCount,
    required this.absences,
    required this.absentees,
  });

  @override
  List<Object?> get props => [
        personnelCount,
        absencesCount,
        absenteesCount,
        absences,
        absentees,
      ];
}

class PersonnelHomeDataEntity extends HomeDataEntity {
  final bool isAbsence;

  const PersonnelHomeDataEntity({
    required this.isAbsence,
  });

  @override
  List<Object?> get props => [isAbsence];
}
