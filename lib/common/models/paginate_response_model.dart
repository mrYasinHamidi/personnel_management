import 'package:json_annotation/json_annotation.dart';
import 'package:personnel_management/common/entities/paginate_response_entity.dart';

part 'paginate_response_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PaginateResponseModel<Model> {
  @JsonKey(name: 'total')
  final int total;

  @JsonKey(name: 'currentPage')
  final int currentPage;

  @JsonKey(name: 'totalPage')
  final int lastPage;

  @JsonKey(name: 'data')
  final List<Model> data;

  const PaginateResponseModel({
    required this.total,
    required this.currentPage,
    required this.lastPage,
    required this.data,
  });

  factory PaginateResponseModel.fromJson(Map<String, dynamic> json, Model Function(Object? json) fromJsonT) =>
      _$PaginateResponseModelFromJson<Model>(json, fromJsonT);

  Map<String, dynamic> toJson(Map<String, dynamic> Function(Model) toJsonT) =>
      _$PaginateResponseModelToJson<Model>(this, toJsonT);

  PaginateResponseEntity<Entity> toEntity<Entity>(Entity Function(Model model) dataToEntity) {
    return PaginateResponseEntity(
      total: total,
      currentPage: currentPage,
      lastPage: lastPage,
      data: data
          .map(
            (e) => dataToEntity(e),
          )
          .toList(),
    );
  }
}
