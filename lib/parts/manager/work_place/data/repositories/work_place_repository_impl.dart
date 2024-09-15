import 'package:dartz/dartz.dart';
import 'package:personnel_management/common/entities/paginate_response_entity.dart';
import 'package:personnel_management/common/models/paginate_response_model.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/parts/manager/work_place/data/data_sources/remote/work_place_remote_data_source.dart';
import 'package:personnel_management/parts/manager/work_place/data/models/work_place_model.dart';
import 'package:personnel_management/parts/manager/work_place/domain/entities/work_place_entity.dart';
import 'package:personnel_management/parts/manager/work_place/domain/params/create_work_place_param.dart';
import 'package:personnel_management/parts/manager/work_place/domain/params/edit_work_place_param.dart';
import 'package:personnel_management/parts/manager/work_place/domain/params/get_work_place_list_param.dart';
import 'package:personnel_management/parts/manager/work_place/domain/repositories/work_place_repository.dart';

class WorkPlaceRepositoryImpl extends WorkPlaceRepository {
  final WorkPlaceRemoteDataSource remoteDataSource;

  const WorkPlaceRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, WorkPlaceEntity>> createWorkPlace(CreateWorkPlaceParam param) => perform(
        () => remoteDataSource.createWorkPlace(param).then(
              (value) => WorkPlaceModel.fromJson(value.data).toEntity(),
            ),
      );

  @override
  Future<Either<Failure, WorkPlaceEntity>> editWorkPlace(EditWorkPlaceParam param) => perform(
        () => remoteDataSource.editWorkPlace(param).then(
              (value) => WorkPlaceModel.fromJson(value.data).toEntity(),
            ),
      );

  @override
  Future<Either<Failure, PaginateResponseEntity<WorkPlaceEntity>>> getWorkPlaceList(GetWorkPlaceListParam param) =>
      perform(
        () => remoteDataSource.getWorkPlaceList(param).then(
              (value) => PaginateResponseModel.fromJson(
                value.data,
                (json) => WorkPlaceModel.fromJson(json as Map<String, dynamic>),
              ).toEntity(
                (model) => model.toEntity(),
              ),
            ),
      );

  @override
  Future<Either<Failure, WorkPlaceEntity>> deleteWorkPlace(String param) => perform(
        () => remoteDataSource.deleteWorkPlace(param).then(
              (value) => WorkPlaceModel.fromJson(value.data).toEntity(),
            ),
      );
}
