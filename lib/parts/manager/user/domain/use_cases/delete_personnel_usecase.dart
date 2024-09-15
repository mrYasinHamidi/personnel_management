import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:personnel_management/common/entities/user_entity.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/core/usecase/use_case.dart';
import 'package:personnel_management/parts/manager/user/domain/repositories/user_repository.dart';

class DeletePersonnelUseCase extends UseCase<PersonnelEntity, String> {
  final UserRepository repository;

  const DeletePersonnelUseCase(this.repository);

  @override
  Future<Either<Failure, PersonnelEntity>> call(String param) {
    return repository.deletePersonnel(param);
  }
}
