import 'package:dartz/dartz.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/parts/home/data/models/home_data_model.dart';
import 'package:personnel_management/parts/home/domain/entities/home_data_entity.dart';
import 'package:personnel_management/parts/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  const HomeRepositoryImpl(super.remoteDataSource);

  @override
  Future<Either<Failure, HomeDataEntity>> getHomeData() {
    return perform(() async {
      final res = await remoteDataSource.getHomeData();
      if (res.statusCode != 200) {
        throw ServerException(res.message);
      }
      return ManagerHomeDataModel.fromJson(res.data).toEntity();
    });
  }
}
