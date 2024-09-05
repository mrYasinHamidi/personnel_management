import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/core/usecase/use_case.dart';
import 'package:personnel_management/parts/work_place/domain/entities/work_place_entity.dart';
import 'package:personnel_management/parts/work_place/domain/params/edit_work_place_param.dart';
import 'package:personnel_management/parts/work_place/domain/repositories/work_place_repository.dart';

class EditWorkPlaceUseCase extends UseCase<WorkPlaceEntity, EditWorkPlaceParam> {
  final WorkPlaceRepository repository;

  const EditWorkPlaceUseCase({required this.repository});

  @override
  Future<Either<Failure, WorkPlaceEntity>> call(EditWorkPlaceParam param) => repository.editWorkPlace(param);
}
