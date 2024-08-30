import 'package:personnel_management/common/response_model.dart';
import 'package:personnel_management/core/data_source/remote_data_source.dart';
import 'package:personnel_management/parts/user/domain/params/create_personnel_params.dart';

abstract class UserRemoteDataSource extends RemoteDataSource {
  const UserRemoteDataSource({required super.request});

  Future<ResponseModel> createPersonnel(CreatePersonnelParams params);
}
