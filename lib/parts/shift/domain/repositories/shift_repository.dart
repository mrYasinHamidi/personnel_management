
import 'package:dartz/dartz.dart';
import 'package:personnel_management/common/entities/paginate_response_entity.dart';
import 'package:personnel_management/common/params/pagination_param.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/core/repository/repository.dart';
import 'package:personnel_management/parts/shift/domain/entities/shift_entity.dart';
import 'package:personnel_management/parts/shift/domain/params/create_shift_param.dart';

abstract class ShiftRepository extends Repository {
  const ShiftRepository();

  Future<Either<Failure, ShiftEntity>> createShift(CreateShiftParam param);

  Future<Either<Failure, PaginateResponseEntity<ShiftEntity>>> getShiftList(PaginationParam param);
}
