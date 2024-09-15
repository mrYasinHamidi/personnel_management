import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/core/usecase/use_case.dart';
import 'package:personnel_management/parts/manager/shift/domain/entities/shift_entity.dart';
import 'package:personnel_management/parts/manager/shift/domain/repositories/shift_repository.dart';

class DeleteShiftUseCase extends UseCase<ShiftEntity, String> {
  final ShiftRepository repository;

  const DeleteShiftUseCase(this.repository);

  @override
  Future<Either<Failure, ShiftEntity>> call(String param) {
    return repository.deleteShift(param);
  }
}
