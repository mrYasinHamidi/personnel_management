import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final dynamic error;

  const Failure(this.error);

  String get message {
    if (this is DioError) {
      return message;
    }
    if (this is Exception) {
      return message;
    }
    return 'Please try again later';
  }

  @override
  List<Object> get props => [error];
}
