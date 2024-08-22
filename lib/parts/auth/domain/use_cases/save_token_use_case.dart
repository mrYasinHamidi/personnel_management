import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/core/usecase/use_case.dart';
import 'package:personnel_management/parts/auth/domain/entities/token_entity.dart';
import 'package:personnel_management/parts/auth/domain/repositories/auth_repository.dart';

class SaveTokenUseCase extends UseCase<void, TokenEntity> {
  final AuthRepository repository;

  const SaveTokenUseCase({required this.repository});

  @override
  FutureOr<Either<Failure, void>> call(TokenEntity param) => repository.saveToken(param);
}
