import 'package:dartz/dartz.dart';
import 'package:personnel_management/common/entities/paginate_response_entity.dart';
import 'package:personnel_management/common/models/paginate_response_model.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/parts/manager/shift/data/data_sources/remote/shift_remote_data_source.dart';
import 'package:personnel_management/parts/manager/shift/data/models/shift_model.dart';
import 'package:personnel_management/parts/manager/shift/domain/entities/shift_entity.dart';
import 'package:personnel_management/parts/manager/shift/domain/params/create_shift_param.dart';
import 'package:personnel_management/parts/manager/shift/domain/params/edit_shift_param.dart';
import 'package:personnel_management/parts/manager/shift/domain/params/get_shift_list_param.dart';
import 'package:personnel_management/parts/manager/shift/domain/repositories/shift_repository.dart';

class ShiftRepositoryImpl extends ShiftRepository {
  final ShiftRemoteDataSource remoteDataSource;

  const ShiftRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, ShiftEntity>> createShift(CreateShiftParam param) => perform(
        () => remoteDataSource.createShift(param).then(
              (value) => ShiftModel.fromJson(value.data).toEntity(),
            ),
      );

  @override
  Future<Either<Failure, PaginateResponseEntity<ShiftEntity>>> getShiftList(GetShiftListParam param) => perform(
        () => remoteDataSource.getShiftList(param).then(
              (value) => PaginateResponseModel.fromJson(
                value.data,
                (json) => ShiftModel.fromJson(json as Map<String, dynamic>),
              ).toEntity(
                (model) => model.toEntity(),
              ),
            ),
      );

  @override
  Future<Either<Failure, ShiftEntity>> editShift(EditShiftParam param) => perform(
        () => remoteDataSource.editShift(param).then(
              (value) => ShiftModel.fromJson(value.data).toEntity(),
            ),
      );

  @override
  Future<Either<Failure, ShiftEntity>> deleteShift(String id) => perform(
        () => remoteDataSource.deleteShift(id).then(
              (value) => ShiftModel.fromJson(value.data).toEntity(),
            ),
      );
}
