import 'dart:async';

import 'package:dartz/dartz.dart';

import '../error/error.dart';

abstract class BaseUseCase<Type> {
  const BaseUseCase();

  Future<Either<Failure, T>> perform<T>(Future<T> Function() func) async {
    try {
      return Right(await func());
    } catch (e) {
      return Left(Failure(e));
    }
  }

  Either<Failure, T> performSync<T>(T Function() func) {
    try {
      return Right(func());
    } catch (e) {
      return Left(Failure(e));
    }
  }
}

abstract class UseCase<Type, Params> extends BaseUseCase<Type> {
  const UseCase();

  FutureOr<Either<Failure, Type>> call(Params param);
}

abstract class NoParamUseCase<Type> extends BaseUseCase<Type> {
  const NoParamUseCase();

  FutureOr<Either<Failure, Type>> call();
}
