import 'package:dartz/dartz.dart';
import 'package:personnel_management/common/entities/paginate_response_entity.dart';
import 'package:personnel_management/common/models/paginate_response_model.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/parts/shift/data/data_sources/remote/shift_remote_data_source.dart';
import 'package:personnel_management/parts/shift/data/models/shift_model.dart';
import 'package:personnel_management/parts/shift/domain/entities/shift_entity.dart';
import 'package:personnel_management/parts/shift/domain/params/create_shift_param.dart';
import 'package:personnel_management/parts/shift/domain/params/get_shift_list_param.dart';
import 'package:personnel_management/parts/shift/domain/repositories/shift_repository.dart';

class ShiftRepositoryImpl extends ShiftRepository {
  final ShiftRemoteDataSource remoteDataSource;

  const ShiftRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, ShiftEntity>> createShift(CreateShiftParam param) async {
    return perform(() async {
      final response = await remoteDataSource.createShift(param);

      if (response.statusCode != 200) {
        throw ServerException(response.message);
      }
      return ShiftModel.fromJson(response.data).toEntity();
    });
  }

  @override
  Future<Either<Failure, PaginateResponseEntity<ShiftEntity>>> getShiftList(GetShiftListParam param) {
    return perform(
      () async {
        final response = await remoteDataSource.getShiftList(param);
        if (response.statusCode != 200) {
          throw ServerException(response.message);
        }
        final paginationModel = PaginateResponseModel.fromJson(
          response.data,
          (json) => ShiftModel.fromJson(json as Map<String, dynamic>),
        );

        return paginationModel.toEntity((model) => model.toEntity());
      },
    );
  }
}
