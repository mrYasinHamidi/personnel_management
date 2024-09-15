import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/core/usecase/use_case.dart';
import 'package:personnel_management/parts/work_place/domain/entities/work_place_entity.dart';
import 'package:personnel_management/parts/work_place/domain/repositories/work_place_repository.dart';

class DeleteWorkPlaceUseCase extends UseCase<WorkPlaceEntity, String> {
  final WorkPlaceRepository repository;

  const DeleteWorkPlaceUseCase(this.repository);

  @override
  Future<Either<Failure, WorkPlaceEntity>> call(String param) {
    return repository.deleteWorkPlace(param);
  }
}
