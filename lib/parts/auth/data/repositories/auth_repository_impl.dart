import 'package:dartz/dartz.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/parts/auth/data/data_sources/local/auth_local_datasource.dart';
import 'package:personnel_management/parts/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:personnel_management/parts/auth/data/models/token_model.dart';
import 'package:personnel_management/parts/auth/domain/entities/token_entity.dart';
import 'package:personnel_management/parts/auth/domain/params/login_param.dart';
import 'package:personnel_management/parts/auth/domain/params/signup_param.dart';
import 'package:personnel_management/parts/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSource remoteDataSource;

  const AuthRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Either<Failure, TokenEntity> getSavedToken() {
    return performSync(() {
      return localDataSource.getToken().toEntity();
    });
  }

  @override
  Future<Either<Failure, TokenEntity>> login(LoginParam param) => perform(
        () => remoteDataSource.login(param).then(
              (value) => TokenModel.fromJson(value.data).toEntity(),
            ),
      );

  @override
  Future<Either<Failure, TokenEntity>> refreshToken(String refreshToken) => perform(
        () => remoteDataSource.refreshToken(refreshToken).then(
              (value) => TokenModel.fromJson(value.data).toEntity(),
            ),
      );

  @override
  Future<Either<Failure, void>> register(SignupParam param) => perform(() => remoteDataSource.register(param));

  @override
  Future<Either<Failure, void>> saveToken(TokenEntity token) => perform(
        () => localDataSource.saveToken(
          TokenModel.fromEntity(token),
        ),
      );
}
