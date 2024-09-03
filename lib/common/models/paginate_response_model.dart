import 'package:json_annotation/json_annotation.dart';
import 'package:personnel_management/common/entities/paginate_response_entity.dart';

part 'paginate_response_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PaginateResponseModel<T> extends PaginateResponseEntity<T> {
  @JsonKey(name: 'total')
  final int _total;

  @JsonKey(name: 'currentPage')
  final int _currentPage;

  @JsonKey(name: 'lastPage')
  final int _lastPage;

  @JsonKey(name: 'data')
  final List<T> _data;

  const PaginateResponseModel({
    required super.total,
    required super.currentPage,
    required super.lastPage,
    required super.data,
  })  : _total = total,
        _data = data,
        _currentPage = currentPage,
        _lastPage = lastPage;

  factory PaginateResponseModel.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$PaginateResponseModelFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJsonT) =>
      _$PaginateResponseModelToJson<T>(this, toJsonT);
}
