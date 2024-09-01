
import 'package:dartz/dartz.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/parts/shift/data/data_sources/remote/shift_remote_data_source.dart';
import 'package:personnel_management/parts/shift/data/models/shift_model.dart';
import 'package:personnel_management/parts/shift/domain/entities/shift_entity.dart';
import 'package:personnel_management/parts/shift/domain/params/shift_param.dart';
import 'package:personnel_management/parts/shift/domain/repositories/shift_repository.dart';

class ShiftRepositoryImpl extends ShiftRepository {
  final ShiftRemoteDataSource remoteDataSource;

  const ShiftRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, ShiftEntity>> sampleRequest(ShiftParam param) async {
    return perform(() async {
      final response = await remoteDataSource.sampleRequest(param);

      if (response.statusCode != 200) {
        throw ServerException(response.message);
      }

      return ShiftModel.fromJson(response.data).toEntity();
    });
  }
}
