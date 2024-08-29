import 'package:dartz/dartz.dart';
import 'package:personnel_management/common/entities/user_entity.dart';
import 'package:personnel_management/common/models/user_model.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/parts/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  const HomeRepositoryImpl(super.remoteDataSource);

  @override
  Future<Either<Failure, List<UserEntity>>> getUsers() {
    return perform(() async {
      final res = await remoteDataSource.getUsers();
      if (res.statusCode != 200) {
        throw ServerException(res.message);
      }
      return (res.data as List).map((e) => UserModel.fromJson(e).toEntity()).toList();
    });
  }
}
