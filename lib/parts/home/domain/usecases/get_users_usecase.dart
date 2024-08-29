import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:personnel_management/common/entities/user_entity.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/core/usecase/use_case.dart';
import 'package:personnel_management/parts/home/domain/repository/home_repository.dart';

class GetUsersUseCase extends NoParamUseCase<List<UserEntity>> {
  final HomeRepository homeRepository;

  const GetUsersUseCase(this.homeRepository);

  @override
  FutureOr<Either<Failure, List<UserEntity>>> call() => homeRepository.getUsers();
}
