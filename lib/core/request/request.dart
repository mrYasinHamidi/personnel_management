import 'dart:ui';

import 'package:dio/dio.dart';

part 'default_interceptor.dart';

typedef TokenProvider = String? Function();
typedef BaseUrlProvider = String Function();
typedef TokenChanged = String Function(String refreshToken, String accessToken);

class Request {
  final Dio _dio = Dio();
  final TokenProvider token;
  final BaseUrlProvider baseUrl;
  final VoidCallback? unAuthorizedHandler;
  final TokenChanged? onTokenChanged;

  Request({
    required this.token,
    required this.baseUrl,
    this.unAuthorizedHandler,
    this.onTokenChanged,
  }) {
    _dio.interceptors.add(
      DefaultInterceptor(
        findToken: token,
        unAuthorizedHandler: unAuthorizedHandler,
      ),
    );
  }

  Future<Response> get(
    String path, {
    String? baseUrl,
    Map<String, dynamic>? queryParameters,
  }) =>
      _dio.get(
        '${baseUrl ?? this.baseUrl()}$path',
        queryParameters: queryParameters,
      );

  Future<Response> post(
    String path, {
    String? baseUrl,
    Map<String, dynamic>? queryParameters,
    data,
  }) =>
      _dio.post(
        '${baseUrl ?? this.baseUrl()}$path',
        queryParameters: queryParameters,
        data: data,
      );

  Future<Response> delete(
    String path, {
    String? baseUrl,
    Map<String, dynamic>? queryParameters,
    data,
  }) =>
      _dio.delete(
        '${baseUrl ?? this.baseUrl()}$path',
        queryParameters: queryParameters,
        data: data,
      );
}
