import 'package:personnel_management/common/response_model.dart';
import 'package:personnel_management/parts/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:personnel_management/parts/auth/data/data_sources/remote/endpoints.dart';
import 'package:personnel_management/parts/auth/domain/params/login_param.dart';
import 'package:personnel_management/parts/auth/domain/params/signup_param.dart';

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl({required super.request});

  @override
  Future<ResponseModel> login(LoginParam param) async {
    final res = await request.post(
      AuthEndpoints.login,
      data: param.toJson(),
    );
    return ResponseModel.fromJson(res.data);
  }

  @override
  Future<ResponseModel> register(SignupParam param) async {
    final res = await request.post(
      AuthEndpoints.register,
      data: param.toJson(),
    );
    return ResponseModel.fromJson(res.data);
  }

  @override
  Future<ResponseModel> refreshToken(String refreshToken) async {
    final res = await request.post(
      AuthEndpoints.refreshToken,
      data: {'refreshToken': refreshToken},
      callIsolate: true,
    );
    return ResponseModel.fromJson(res.data);
  }
}
