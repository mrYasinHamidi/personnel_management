
import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/core/usecase/use_case.dart';
import 'package:personnel_management/parts/shift/domain/entities/shift_entity.dart';
import 'package:personnel_management/parts/shift/domain/params/create_shift_param.dart';
import 'package:personnel_management/parts/shift/domain/repositories/shift_repository.dart';

class CreateShiftUseCase extends UseCase<ShiftEntity, CreateShiftParam> {
  final ShiftRepository repository;

  const CreateShiftUseCase({required this.repository});

  @override
  Future<Either<Failure, ShiftEntity>> call(CreateShiftParam param) => repository.createShift(param);
}

