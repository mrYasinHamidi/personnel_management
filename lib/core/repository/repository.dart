import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:personnel_management/common/response_model.dart';
import 'package:personnel_management/core/error/error.dart';
import 'package:personnel_management/main.dart';

abstract class Repository {
  const Repository();

  Future<Either<Failure, T>> perform1<T>({
    required Future<ResponseModel> Function() request,
    required T Function(dynamic json) parser,
  }) async {
    try {
      final res = await request();
      if (res.statusCode != 200) {
        throw ServerException(res.message);
      } else if (res.statusCode == 401) {
        throw UnauthorizedException();
      }
      final entity = parser(res.data);
      return Right(entity);
    } catch (e, s) {
      return Left(_handleError(e, s));
    }
  }

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
