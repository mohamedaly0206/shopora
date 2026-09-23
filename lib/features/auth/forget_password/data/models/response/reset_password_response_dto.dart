import 'package:json_annotation/json_annotation.dart';
import 'package:shopora/features/auth/forget_password/domain/entities/response/reset_password_response_entity.dart';

part 'reset_password_response_dto.g.dart';

@JsonSerializable()
class ResetPasswordResponseDto {
  final String? token;

  const ResetPasswordResponseDto({
    this.token,
  });

  factory ResetPasswordResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordResponseDtoToJson(this);

  ResetPasswordResponseEntity toDomain() => ResetPasswordResponseEntity(
        token: token,
      );
}
