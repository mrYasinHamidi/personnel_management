import 'package:personnel_management/core/repository/repository.dart';
import 'package:personnel_management/parts/auth/domain/entities/token_entity.dart';
import 'package:personnel_management/parts/auth/domain/params/login_param.dart';
import 'package:personnel_management/parts/auth/domain/params/signup_param.dart';

abstract class AuthRepository extends Repository {
  const AuthRepository();

  Future<void> saveToken(TokenEntity token);

  TokenEntity getSavedToken();

  Future<TokenEntity> register(SignupParam param);

  Future<TokenEntity> login(LoginParam param);

  Future<TokenEntity> refreshToken(String refreshToken);
}
