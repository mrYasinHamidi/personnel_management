import 'package:dio/dio.dart';
import 'package:personnel_management/common/response_model.dart';

import '../request/request.dart';

typedef FromJson<T> = T Function(Map<String, dynamic> json);

abstract class RemoteDataSource {
  final Request request;

  const RemoteDataSource({required this.request});

  Future<ResponseModel> perform(Future<Response> Function() req) async {
    return ResponseModel.fromJson((await req()).data);
  }
}
