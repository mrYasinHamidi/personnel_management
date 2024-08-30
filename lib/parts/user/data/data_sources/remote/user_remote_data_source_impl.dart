import 'package:personnel_management/common/response_model.dart';
import 'package:personnel_management/core/data_source/remote_data_source.dart';
import 'package:personnel_management/parts/user/data/data_sources/remote/user_remote_data_source.dart';
import 'package:personnel_management/parts/user/domain/params/create_personnel_params.dart';

part 'endpoints.dart';

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  const UserRemoteDataSourceImpl({required super.request});

  @override
  Future<ResponseModel> createPersonnel(CreatePersonnelParams params) async {
    final res = await request.post(personnel, data: params.toJson());
    return ResponseModel.fromJson(res.data);
  }
}
