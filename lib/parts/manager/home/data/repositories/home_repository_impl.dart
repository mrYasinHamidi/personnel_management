import 'package:dartz/dartz.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/parts/manager/home/data/models/home_data_model.dart';
import 'package:personnel_management/parts/manager/home/domain/entities/home_data_entity.dart';
import 'package:personnel_management/parts/manager/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  const HomeRepositoryImpl(super.remoteDataSource);

  @override
  Future<Either<Failure, HomeDataEntity>> getHomeData() => perform(
        () => remoteDataSource.getHomeData().then(
              (value) => ManagerHomeDataModel.fromJson(value.data).toEntity(),
            ),
      );
}
