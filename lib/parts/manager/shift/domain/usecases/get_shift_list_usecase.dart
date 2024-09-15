import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:personnel_management/common/entities/paginate_response_entity.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/core/usecase/use_case.dart';
import 'package:personnel_management/parts/manager/shift/domain/entities/shift_entity.dart';
import 'package:personnel_management/parts/manager/shift/domain/params/get_shift_list_param.dart';
import 'package:personnel_management/parts/manager/shift/domain/repositories/shift_repository.dart';

class GetShiftListUseCase extends UseCase<PaginateResponseEntity<ShiftEntity>, GetShiftListParam> {
  final ShiftRepository repository;

  const GetShiftListUseCase({required this.repository});

  @override
  Future<Either<Failure, PaginateResponseEntity<ShiftEntity>>> call(GetShiftListParam param) =>
      repository.getShiftList(param);
}
