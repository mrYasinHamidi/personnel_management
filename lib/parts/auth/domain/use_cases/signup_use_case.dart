import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/core/usecase/use_case.dart';
import 'package:personnel_management/parts/auth/domain/params/signup_param.dart';
import 'package:personnel_management/parts/auth/domain/repositories/auth_repository.dart';

class SignupUseCase extends UseCase<void, SignupParam> {
  final AuthRepository repository;

  const SignupUseCase({required this.repository});

  @override
  FutureOr<Either<Failure, void>> call(SignupParam param) {
    return perform(
      () => repository.register(param),
    );
  }
}
