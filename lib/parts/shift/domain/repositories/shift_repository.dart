import 'package:dartz/dartz.dart';
import 'package:personnel_management/common/entities/paginate_response_entity.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/core/repository/repository.dart';
import 'package:personnel_management/parts/shift/domain/entities/shift_entity.dart';
import 'package:personnel_management/parts/shift/domain/params/create_shift_param.dart';
import 'package:personnel_management/parts/shift/domain/params/edit_shift_param.dart';
import 'package:personnel_management/parts/shift/domain/params/get_shift_list_param.dart';

abstract class ShiftRepository extends Repository {
  const ShiftRepository();

  Future<Either<Failure, ShiftEntity>> createShift(CreateShiftParam param);

  Future<Either<Failure, ShiftEntity>> editShift(EditShiftParam param);

  Future<Either<Failure, ShiftEntity>> deleteShift(String id);

  Future<Either<Failure, PaginateResponseEntity<ShiftEntity>>> getShiftList(GetShiftListParam param);
}
