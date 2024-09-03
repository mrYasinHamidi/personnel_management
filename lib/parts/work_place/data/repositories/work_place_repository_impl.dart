
import 'package:dartz/dartz.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/parts/work_place/data/data_sources/remote/work_place_remote_data_source.dart';
import 'package:personnel_management/parts/work_place/data/models/work_place_model.dart';
import 'package:personnel_management/parts/work_place/domain/entities/work_place_entity.dart';
import 'package:personnel_management/parts/work_place/domain/params/create_work_place_param.dart';
import 'package:personnel_management/parts/work_place/domain/repositories/work_place_repository.dart';

class WorkPlaceRepositoryImpl extends WorkPlaceRepository {
  final WorkPlaceRemoteDataSource remoteDataSource;

  const WorkPlaceRepositoryImpl({
    required this.remoteDataSource,
  });
  
  @override
  Future<Either<Failure, WorkPlaceEntity>> createWorkPlace(CreateWorkPlaceParam param) async {
    return perform(() async {
      final response = await remoteDataSource.sampleRequest(param);

      if (response.statusCode != 200) {
        throw ServerException(response.message);
      }

      return WorkPlaceModel.fromJson(response.data).toEntity();
    });
  }
}
