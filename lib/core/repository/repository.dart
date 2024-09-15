import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/main.dart';

abstract class Repository {
  const Repository();

  Future<Either<Failure, T>> perform<T>(Future<T> Function() func) async {
    try {
      return Right(await func());
    } catch (e, s) {
      return Left(_handleError(e, s));
    }
  }

  Either<Failure, T> performSync<T>(T Function() func) {
    try {
      return Right(func());
    } catch (e, s) {
      return Left(_handleError(e, s));
    }
  }

  Failure _handleError(e, s) {
    if (e is UnauthorizedException) {
      Setup.logout();
    }
    debugPrint(e.toString());
    debugPrint(s.toString());
    return Failure(e);
  }
}
