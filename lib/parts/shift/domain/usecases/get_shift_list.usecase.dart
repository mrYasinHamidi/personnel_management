import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:personnel_management/common/params/pagination_param.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/core/usecase/use_case.dart';
import 'package:personnel_management/parts/shift/domain/entities/shift_entity.dart';
import 'package:personnel_management/parts/shift/domain/params/create_shift_param.dart';
import 'package:personnel_management/parts/shift/domain/repositories/shift_repository.dart';

class GetShiftListUseCase extends UseCase<ShiftEntity, PaginationParam> {
  final ShiftRepository repository;

  const GetShiftListUseCase({required this.repository});

  @override
  FutureOr<Either<Failure, ShiftEntity>> call(PaginationParam param) => repository.createShift(param);
}
