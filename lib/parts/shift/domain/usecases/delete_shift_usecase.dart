import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:personnel_management/common/entities/user_entity.dart';
import 'package:personnel_management/common/entities/user_entity.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/core/usecase/use_case.dart';
import 'package:personnel_management/parts/shift/domain/entities/shift_entity.dart';
import 'package:personnel_management/parts/shift/domain/repositories/shift_repository.dart';
import 'package:personnel_management/parts/user/domain/params/create_personnel_params.dart';
import 'package:personnel_management/parts/user/domain/repositories/user_repository.dart';

class DeleteShiftUseCase extends UseCase<ShiftEntity, String> {
  final ShiftRepository repository;

  const DeleteShiftUseCase(this.repository);

  @override
  Future<Either<Failure, ShiftEntity>> call(String param) {
    return repository.deleteShift(param);
  }
}
