import 'package:dartz/dartz.dart';
import 'package:personnel_management/common/entities/user_entity.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/core/repository/repository.dart';
import 'package:personnel_management/parts/user/data/data_sources/remote/user_remote_data_source.dart';
import 'package:personnel_management/parts/user/domain/params/create_personnel_params.dart';

abstract class UserRepository extends Repository {
  final UserRemoteDataSource remoteDataSource;

  const UserRepository(this.remoteDataSource);

  Future<Either<Failure, PersonnelEntity>> createPersonnel(CreatePersonnelParams params);
}
