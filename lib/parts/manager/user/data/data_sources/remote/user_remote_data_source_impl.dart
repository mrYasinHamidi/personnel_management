import 'package:personnel_management/common/response_model.dart';
import 'package:personnel_management/parts/manager/user/data/data_sources/remote/user_remote_data_source.dart';
import 'package:personnel_management/parts/manager/user/domain/params/create_personnel_params.dart';
import 'package:personnel_management/parts/manager/user/domain/params/edit_personnel_params.dart';
import 'package:personnel_management/parts/manager/user/domain/params/get_personnel_list_param.dart';

part 'endpoints.dart';

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  const UserRemoteDataSourceImpl({required super.request});

  @override
  Future<ResponseModel> createPersonnel(CreatePersonnelParams params) => perform(
        () => request.post(
          personnel,
          data: params.toJson(),
        ),
      );

  @override
  Future<ResponseModel> getPersonnelList(GetPersonnelListParam params) => perform(
        () => request.get(
          personnel,
          queryParameters: params.toJson(),
        ),
      );

  @override
  Future<ResponseModel> deletePersonnel(String id) => perform(
        () => request.delete('$personnel/$id'),
      );

  @override
  Future<ResponseModel> editPersonnel(EditPersonnelParams params) => perform(
        () => request.put(
          personnel,
          data: params.toJson(),
        ),
      );
}
