import 'package:equatable/equatable.dart';

class ResponseState<T> extends Equatable {
  final bool loading;
  final String? error;
  final T? data;

  const ResponseState({
    required this.loading,
    required this.error,
    required this.data,
  });

  factory ResponseState.loading() => const ResponseState(loading: true, error: null, data: null);

  factory ResponseState.success(T data) => ResponseState(loading: false, error: null, data: data);

  factory ResponseState.error(String error) => ResponseState(loading: false, error: error, data: null);

  @override
  List<Object?> get props => [loading, error, data];
}
