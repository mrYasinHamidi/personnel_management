import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:personnel_management/common/entities/paginate_response_entity.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/core/usecase/use_case.dart';
import 'package:personnel_management/parts/manager/work_place/domain/entities/work_place_entity.dart';
import 'package:personnel_management/parts/manager/work_place/domain/params/get_work_place_list_param.dart';
import 'package:personnel_management/parts/manager/work_place/domain/repositories/work_place_repository.dart';

class GetWorkPlaceListUseCase extends UseCase<PaginateResponseEntity<WorkPlaceEntity>, GetWorkPlaceListParam> {
  final WorkPlaceRepository repository;

  const GetWorkPlaceListUseCase({required this.repository});

  @override
  Future<Either<Failure, PaginateResponseEntity<WorkPlaceEntity>>> call(GetWorkPlaceListParam param) =>
      repository.getWorkPlaceList(param);
}
