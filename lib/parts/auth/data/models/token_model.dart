import 'package:json_annotation/json_annotation.dart';
import 'package:personnel_management/parts/auth/domain/entities/token_entity.dart';

part 'token_model.g.dart';

@JsonSerializable()
class TokenModel {
  final String accessToken;
  final String refreshToken;

  const TokenModel({
    required this.accessToken,
    required this.refreshToken,
  });

  factory TokenModel.fromEntity(TokenEntity entity) => TokenModel(
        accessToken: entity.accessToken,
        refreshToken: entity.refreshToken,
      );

  factory TokenModel.fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);

  TokenEntity toEntity() {
    return TokenEntity(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}
