import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/core/usecase/use_case.dart';
import 'package:personnel_management/parts/user/domain/params/create_personnel_params.dart';
import 'package:personnel_management/parts/user/domain/repositories/user_repository.dart';

class CreatePersonnelUseCase extends UseCase<void, CreatePersonnelParams> {
  final UserRepository repository;

  const CreatePersonnelUseCase(this.repository);

  @override
  FutureOr<Either<Failure, void>> call(CreatePersonnelParams param) {
    return repository.createPersonnel(param);
  }
}
