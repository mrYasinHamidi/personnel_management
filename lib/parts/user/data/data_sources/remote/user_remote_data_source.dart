import 'package:personnel_management/common/response_model.dart';
import 'package:personnel_management/core/data_source/remote_data_source.dart';
import 'package:personnel_management/parts/user/domain/params/create_personnel_params.dart';
import 'package:personnel_management/parts/user/domain/params/edit_personnel_params.dart';
import 'package:personnel_management/parts/user/domain/params/get_personnel_list_param.dart';

abstract class UserRemoteDataSource extends RemoteDataSource {
  const UserRemoteDataSource({required super.request});

  Future<ResponseModel> createPersonnel(CreatePersonnelParams params);

  Future<ResponseModel> getPersonnelList(GetPersonnelListParam params);

  Future<ResponseModel> editPersonnelList(EditPersonnelParams params);

  Future<ResponseModel> deletePersonnelList(String id);
}
