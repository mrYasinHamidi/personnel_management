import 'package:dartz/dartz.dart';
import 'package:personnel_management/common/entities/user_entity.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/core/repository/repository.dart';
import 'package:personnel_management/parts/home/data/data_dources/remote/home_remote_data_source.dart';

abstract class HomeRepository extends Repository {
  final HomeRemoteDataSource remoteDataSource;

  const HomeRepository(this.remoteDataSource);

  Future<Either<Failure, List<UserEntity>>> getUsers();
}
