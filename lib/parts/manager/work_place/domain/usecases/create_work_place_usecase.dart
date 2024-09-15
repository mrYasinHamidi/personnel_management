import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/core/usecase/use_case.dart';
import 'package:personnel_management/parts/manager/work_place/domain/entities/work_place_entity.dart';
import 'package:personnel_management/parts/manager/work_place/domain/params/create_work_place_param.dart';
import 'package:personnel_management/parts/manager/work_place/domain/repositories/work_place_repository.dart';

class CreateWorkPlaceUseCase extends UseCase<WorkPlaceEntity, CreateWorkPlaceParam> {
  final WorkPlaceRepository repository;

  const CreateWorkPlaceUseCase({required this.repository});

  @override
  Future<Either<Failure, WorkPlaceEntity>> call(CreateWorkPlaceParam param) => repository.createWorkPlace(param);
}
