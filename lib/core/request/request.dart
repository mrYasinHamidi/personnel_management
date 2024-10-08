import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

part 'default_interceptor.dart';

part 'log_interceptor.dart';

typedef TokenProvider = String? Function();
typedef BaseUrlProvider = String Function();
typedef UnAuthorizedHandler = Future<void> Function();

class Request {
  final Dio _dio = Dio();
  final BaseUrlProvider baseUrl;

  TokenProvider? _tokenProvider;
  UnAuthorizedHandler? _unAuthorizedHandler;

  Request({
    required this.baseUrl,
  }) {
    _dio.interceptors
      ..add(
        DefaultInterceptor(
          findToken: () => _tokenProvider?.call(),
          unAuthorizedHandler: () => _unAuthorizedHandler?.call(),
        ),
      )
      ..add(const LogInterceptor());
  }

  setTokenProvider(TokenProvider tokenProvider) => _tokenProvider = tokenProvider;

  setUnAuthorizedHandler(UnAuthorizedHandler unAuthorizedHandler) => _unAuthorizedHandler = unAuthorizedHandler;

  Future<Response> get(
    String path, {
    String? baseUrl,
    Map<String, dynamic>? queryParameters,
    bool callIsolate = false,
  }) =>
      (callIsolate ? Dio() : _dio).get(
        '${baseUrl ?? this.baseUrl()}$path',
        queryParameters: queryParameters,
      );

  Future<Response> post(
    String path, {
    String? baseUrl,
    Map<String, dynamic>? queryParameters,
    data,
    bool callIsolate = false,
  }) =>
      (callIsolate ? Dio() : _dio).post(
        '${baseUrl ?? this.baseUrl()}$path',
        queryParameters: queryParameters,
        data: data,
      );

  Future<Response> put(
    String path, {
    String? baseUrl,
    Map<String, dynamic>? queryParameters,
    data,
    bool callIsolate = false,
  }) =>
      (callIsolate ? Dio() : _dio).put(
        '${baseUrl ?? this.baseUrl()}$path',
        queryParameters: queryParameters,
        data: data,
      );

  Future<Response> delete(
    String path, {
    String? baseUrl,
    Map<String, dynamic>? queryParameters,
    data,
    bool callIsolate = false,
  }) =>
      (callIsolate ? Dio() : _dio).delete(
        '${baseUrl ?? this.baseUrl()}$path',
        queryParameters: queryParameters,
        data: data,
      );
}
