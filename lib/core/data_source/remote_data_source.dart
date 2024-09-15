import 'package:dio/dio.dart';
import 'package:personnel_management/common/response_model.dart';
import 'package:personnel_management/core/error/error.dart';

import '../request/request.dart';

typedef FromJson<T> = T Function(Map<String, dynamic> json);

abstract class RemoteDataSource {
  final Request request;

  const RemoteDataSource({required this.request});

  Future<ResponseModel> perform(Future<Response> Function() req) async {
    final response = ResponseModel.fromJson((await req()).data);
    if (response.statusCode != 200) {
      throw ServerException('serverError');
    } else {
      return response;
    }
  }
}
