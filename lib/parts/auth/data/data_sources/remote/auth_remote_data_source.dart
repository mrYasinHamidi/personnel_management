import 'package:personnel_management/common/response_model.dart';
import 'package:personnel_management/core/data_source/remote_data_source.dart';
import 'package:personnel_management/parts/auth/domain/params/login_param.dart';
import 'package:personnel_management/parts/auth/domain/params/signup_param.dart';

abstract class AuthRemoteDataSource extends RemoteDataSource {
  const AuthRemoteDataSource({required super.request});

  Future<ResponseModel> register(SignupParam param);

  Future<ResponseModel> login(LoginParam param);

  Future<ResponseModel> refreshToken(String refreshToken);
}
