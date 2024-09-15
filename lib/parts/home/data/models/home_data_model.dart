import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:personnel_management/common/models/user_model.dart';
import 'package:personnel_management/parts/home/domain/entities/home_data_entity.dart';

part 'home_data_model.g.dart';

sealed class HomeDataModel extends Equatable {
  const HomeDataModel();

  factory HomeDataModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      json['personnelCount'] != null ? ManagerHomeDataModel.fromJson(json) : PersonnelHomeDataModel.fromJson(json);

  HomeDataEntity toEntity();
}

@JsonSerializable()
class ManagerHomeDataModel extends HomeDataModel {
  @JsonKey(name: 'personnelCount')
  final int personnelCount;
  @JsonKey(name: 'absencesCount')
  final int absencesCount;
  @JsonKey(name: 'absenteesCount')
  final int absenteesCount;
  @JsonKey(name: 'absences')
  final List<PersonnelModel> absences;
  @JsonKey(name: 'absentees')
  final List<PersonnelModel> absentees;

  const ManagerHomeDataModel({
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

  factory ManagerHomeDataModel.fromJson(Map<String, dynamic> json) => _$ManagerHomeDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManagerHomeDataModelToJson(this);

  @override
  ManagerHomeDataEntity toEntity() {
    return ManagerHomeDataEntity(
      personnelCount: personnelCount,
      absencesCount: absencesCount,
      absenteesCount: absenteesCount,
      absences: absences,
      absentees: absentees,
    );
  }
}

@JsonSerializable()
class PersonnelHomeDataModel extends HomeDataModel {
  @JsonKey(name: 'isAbsence')
  final bool isAbsence;

  const PersonnelHomeDataModel({
    required this.isAbsence,
  });

  @override
  List<Object?> get props => [isAbsence];

  factory PersonnelHomeDataModel.fromJson(Map<String, dynamic> json) => _$PersonnelHomeDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$PersonnelHomeDataModelToJson(this);

  @override
  PersonnelHomeDataEntity toEntity() {
    return PersonnelHomeDataEntity(isAbsence: isAbsence);
  }
}
