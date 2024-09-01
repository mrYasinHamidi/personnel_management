import 'package:dartz/dartz.dart';
import 'package:personnel_management/common/entities/user_entity.dart';
import 'package:personnel_management/common/models/user_model.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/parts/user/domain/params/create_personnel_params.dart';
import 'package:personnel_management/parts/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  const UserRepositoryImpl(super.remoteDataSource);

  @override
  Future<Either<Failure, PersonnelEntity>> createPersonnel(CreatePersonnelParams params) {
    return perform(() async {
      final res = await remoteDataSource.createPersonnel(params);
      if (res.statusCode != 200) {
        throw ServerException(res.message);
      }
      return PersonnelModel.fromJson(res.data).toEntity();
    });
  }
}
