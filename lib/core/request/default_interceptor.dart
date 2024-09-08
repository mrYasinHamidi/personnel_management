part of 'request.dart';

class DefaultInterceptor extends Interceptor {
  final TokenProvider findToken;
  final Future<void>? Function()? unAuthorizedHandler;
  final UnAuthorizedHandler? onTokenChanged;

  bool _refreshingToken = false;

  DefaultInterceptor({
    required this.findToken,
    this.unAuthorizedHandler,
    this.onTokenChanged,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['authorization'] = 'Bearer ${findToken.call()}';
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.data['statusCode'] == 401 && !_refreshingToken) {
      _refreshingToken = true;

      await unAuthorizedHandler?.call();

      _refreshingToken = false;
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 && !_refreshingToken) {
      _refreshingToken = true;

      await unAuthorizedHandler?.call();

      _refreshingToken = false;
    }
    super.onError(err, handler);
  }
}
