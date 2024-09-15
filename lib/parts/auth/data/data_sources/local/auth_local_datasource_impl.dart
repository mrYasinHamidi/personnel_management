import 'dart:convert';

import 'package:personnel_management/parts/auth/data/data_sources/local/auth_local_datasource.dart';
import 'package:personnel_management/parts/auth/data/models/token_model.dart';


class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final String _tokenKey = 'tokenKey';

  AuthLocalDataSourceImpl() : super('authStorage');

  @override
  TokenModel getToken() {
    return TokenModel.fromJson(
      jsonDecode(
        read(_tokenKey),
      ),
    );
  }

  @override
  Future<void> saveToken(TokenModel token) {
    return write(
      _tokenKey,
      jsonEncode(
        token.toJson(),
      ),
    );
  }

  static Future<AuthLocalDataSourceImpl> build() async {
    final authLocalDataSource = AuthLocalDataSourceImpl();
    await authLocalDataSource.ensureInitialized();
    return authLocalDataSource;
  }
}
