import '../request/request.dart';

typedef FromJson<T> = T Function(Map<String, dynamic> json);

abstract class RemoteDataSource {
  final Request request;

  const RemoteDataSource({required this.request});
}
