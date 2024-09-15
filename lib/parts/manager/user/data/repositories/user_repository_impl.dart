import 'package:dartz/dartz.dart';
import 'package:personnel_management/common/entities/paginate_response_entity.dart';
import 'package:personnel_management/common/entities/user_entity.dart';
import 'package:personnel_management/common/models/paginate_response_model.dart';
import 'package:personnel_management/common/models/user_model.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/parts/manager/user/domain/params/create_personnel_params.dart';
import 'package:personnel_management/parts/manager/user/domain/params/edit_personnel_params.dart';
import 'package:personnel_management/parts/manager/user/domain/params/get_personnel_list_param.dart';
import 'package:personnel_management/parts/manager/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  const UserRepositoryImpl(super.remoteDataSource);

  @override
  Future<Either<Failure, PersonnelEntity>> createPersonnel(CreatePersonnelParams params) => perform(
        () => remoteDataSource.createPersonnel(params).then(
              (value) => PersonnelModel.fromJson(value.data).toEntity(),
            ),
      );

  @override
  Future<Either<Failure, PaginateResponseEntity<PersonnelEntity>>> getPersonnelList(GetPersonnelListParam params) =>
      perform(
        () => remoteDataSource.getPersonnelList(params).then(
              (value) => PaginateResponseModel.fromJson(
                value.data,
                (json) => PersonnelModel.fromJson(json),
              ).toEntity(
                (model) => model.toEntity(),
              ),
            ),
      );

  @override
  Future<Either<Failure, PersonnelEntity>> deletePersonnel(String id) => perform(
        () => remoteDataSource.deletePersonnel(id).then(
              (value) => PersonnelModel.fromJson(value.data).toEntity(),
            ),
      );

  @override
  Future<Either<Failure, PersonnelEntity>> editPersonnel(EditPersonnelParams params) => perform(
        () => remoteDataSource.editPersonnel(params).then(
              (value) => PersonnelModel.fromJson(value.data).toEntity(),
            ),
      );
}
