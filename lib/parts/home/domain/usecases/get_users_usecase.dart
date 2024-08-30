import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/core/usecase/use_case.dart';
import 'package:personnel_management/parts/home/domain/entities/home_data_entity.dart';
import 'package:personnel_management/parts/home/domain/repository/home_repository.dart';

class GetHomeDataUseCase extends NoParamUseCase<HomeDataEntity> {
  final HomeRepository homeRepository;

  const GetHomeDataUseCase(this.homeRepository);

  @override
  Future<Either<Failure, HomeDataEntity>> call() => homeRepository.getHomeData();
}
