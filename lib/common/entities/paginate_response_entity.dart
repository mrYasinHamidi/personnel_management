import 'package:equatable/equatable.dart';

class PaginateResponseEntity<T> extends Equatable {
  final int total;
  final int currentPage;
  final int lastPage;
  final List<T> data;

  const PaginateResponseEntity({
    required this.total,
    required this.currentPage,
    required this.lastPage,
    required this.data,
  });

  @override
  List<Object?> get props => [
        total,
        currentPage,
        lastPage,
        data,
      ];
}
