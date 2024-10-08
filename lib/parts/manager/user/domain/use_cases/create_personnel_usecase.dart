import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:personnel_management/common/entities/user_entity.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/core/usecase/use_case.dart';
import 'package:personnel_management/parts/manager/user/domain/params/create_personnel_params.dart';
import 'package:personnel_management/parts/manager/user/domain/repositories/user_repository.dart';

class CreatePersonnelUseCase extends UseCase<PersonnelEntity, CreatePersonnelParams> {
  final UserRepository repository;

  const CreatePersonnelUseCase(this.repository);

  @override
  Future<Either<Failure, PersonnelEntity>> call(CreatePersonnelParams param) {
    return repository.createPersonnel(param);
  }
}
