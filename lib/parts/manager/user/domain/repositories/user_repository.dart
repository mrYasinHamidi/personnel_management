import 'package:dartz/dartz.dart';
import 'package:personnel_management/common/entities/paginate_response_entity.dart';
import 'package:personnel_management/common/entities/user_entity.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/core/repository/repository.dart';
import 'package:personnel_management/parts/manager/user/data/data_sources/remote/user_remote_data_source.dart';
import 'package:personnel_management/parts/manager/user/domain/params/create_personnel_params.dart';
import 'package:personnel_management/parts/manager/user/domain/params/edit_personnel_params.dart';
import 'package:personnel_management/parts/manager/user/domain/params/get_personnel_list_param.dart';

abstract class UserRepository extends Repository {
  final UserRemoteDataSource remoteDataSource;

  const UserRepository(this.remoteDataSource);

  Future<Either<Failure, PersonnelEntity>> createPersonnel(CreatePersonnelParams params);

  Future<Either<Failure, PaginateResponseEntity<PersonnelEntity>>> getPersonnelList(GetPersonnelListParam params);

  Future<Either<Failure, PersonnelEntity>> editPersonnel(EditPersonnelParams params);

  Future<Either<Failure, PersonnelEntity>> deletePersonnel(String id);
}
