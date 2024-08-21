part of 'request.dart';

class DefaultInterceptor extends Interceptor {
  final TokenProvider findToken;
  final VoidCallback? unAuthorizedHandler;
  final TokenChanged? onTokenChanged;

  DefaultInterceptor({
    required this.findToken,
    this.unAuthorizedHandler,
    this.onTokenChanged,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['token'] = 'Bearer ${findToken.call()}';
    super.onRequest(options, handler);
  }
}
