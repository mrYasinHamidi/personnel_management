import 'package:dartz/dartz.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/core/repository/repository.dart';
import 'package:personnel_management/parts/auth/domain/entities/token_entity.dart';
import 'package:personnel_management/parts/auth/domain/params/login_param.dart';
import 'package:personnel_management/parts/auth/domain/params/signup_param.dart';

abstract class AuthRepository extends Repository {
  const AuthRepository();

  Future<Either<Failure, void>> saveToken(TokenEntity token);

  Either<Failure, TokenEntity> getSavedToken();

  Future<Either<Failure, void>> register(SignupParam param);

  Future<Either<Failure, TokenEntity>> login(LoginParam param);

  Future<Either<Failure, TokenEntity>> refreshToken(String refreshToken);
}
