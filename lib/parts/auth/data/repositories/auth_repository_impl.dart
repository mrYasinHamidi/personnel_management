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
  Future<TokenEntity> login(LoginParam param) async {
    final model = await remoteDataSource.login(param);
    return model.toEntity();
  }

  @override
  Future<TokenEntity> register(SignupParam param) async {
    final model = await remoteDataSource.register(param);
    return model.toEntity();
  }

  @override
  TokenEntity getSavedToken() {
    return localDataSource.getToken().toEntity();
  }

  @override
  Future<void> saveToken(TokenEntity token) {
    return localDataSource.saveToken(TokenModel.fromEntity(token));
  }

  @override
  Future<TokenEntity> refreshToken(String refreshToken) async {
    final model = await remoteDataSource.refreshToken(refreshToken);
    return model.toEntity();
  }
}
