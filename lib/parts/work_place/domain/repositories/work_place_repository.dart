import 'package:dartz/dartz.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/core/repository/repository.dart';
import 'package:personnel_management/parts/work_place/domain/entities/work_place_entity.dart';
import 'package:personnel_management/parts/work_place/domain/params/create_work_place_param.dart';

abstract class WorkPlaceRepository extends Repository {
  const WorkPlaceRepository();

  Future<Either<Failure, WorkPlaceEntity>> createWorkPlace(CreateWorkPlaceParam param);
}
