import 'package:personnel_management/core/data_source/remote_data_source.dart';
import 'package:personnel_management/parts/auth/data/models/token_model.dart';
import 'package:personnel_management/parts/auth/domain/params/login_param.dart';
import 'package:personnel_management/parts/auth/domain/params/signup_param.dart';

abstract class AuthRemoteDataSource extends RemoteDataSource {
  const AuthRemoteDataSource({required super.request});

  Future<TokenModel> register(SignupParam param);

  Future<TokenModel> login(LoginParam param);

  Future<TokenModel> refreshToken(String refreshToken);
}
