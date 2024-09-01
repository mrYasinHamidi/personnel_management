
import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/core/usecase/use_case.dart';
import 'package:personnel_management/parts/shift/domain/entities/shift_entity.dart';
import 'package:personnel_management/parts/shift/domain/params/shift_param.dart';
import 'package:personnel_management/parts/shift/domain/repositories/shift_repository.dart';

class ShiftUseCase extends UseCase<ShiftEntity, ShiftParam> {
  final ShiftRepository repository;

  const ShiftUseCase({required this.repository});

  @override
  FutureOr<Either<Failure, ShiftEntity>> call(ShiftParam param) => repository.sampleRequest(param);
}

