import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

class Failure extends Equatable {
  final dynamic error;

  const Failure(this.error);

  String get message {
    return switch (error) {
      AppExceptions() => (error as AppExceptions).message,
      DioException() => (error as Exception).toString(),
      _ => 'errorMessage'.tr,
    };
  }

  @override
  List<Object> get props => [error];
}

sealed class AppExceptions extends Error {
  AppExceptions(this.message);

  final String message;
}

class ServerException extends AppExceptions {
  ServerException(super.message);
}

class UnauthorizedException extends AppExceptions {
  UnauthorizedException() : super('');
}
