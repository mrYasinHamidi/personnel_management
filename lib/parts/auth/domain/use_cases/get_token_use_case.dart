import 'package:dartz/dartz.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/core/usecase/use_case.dart';
import 'package:personnel_management/parts/auth/domain/entities/token_entity.dart';
import 'package:personnel_management/parts/auth/domain/repositories/auth_repository.dart';

class GetTokenUseCase extends NoParamUseCase<TokenEntity> {
  final AuthRepository repository;

  const GetTokenUseCase({required this.repository});

  @override
  Either<Failure, TokenEntity> call() => repository.getSavedToken();
}
