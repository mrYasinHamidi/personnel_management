import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:personnel_management/common/entities/paginate_response_entity.dart';
import 'package:personnel_management/common/entities/user_entity.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/core/usecase/use_case.dart';
import 'package:personnel_management/parts/user/domain/params/get_personnel_list_param.dart';
import 'package:personnel_management/parts/user/domain/repositories/user_repository.dart';

class GetPersonnelListUseCase extends UseCase<PaginateResponseEntity<PersonnelEntity>, GetPersonnelListParam> {
  final UserRepository repository;

  const GetPersonnelListUseCase(this.repository);

  @override
  Future<Either<Failure, PaginateResponseEntity<PersonnelEntity>>> call(GetPersonnelListParam param) {
    return repository.getPersonnelList(param);
  }
}
