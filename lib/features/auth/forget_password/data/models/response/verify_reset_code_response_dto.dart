import 'package:json_annotation/json_annotation.dart';
import 'package:shopora/features/auth/forget_password/domain/entities/response/verify_reset_code_response_entity.dart';

part 'verify_reset_code_response_dto.g.dart';

@JsonSerializable()
class VerifyResetCodeResponseDto {
  final String? status;

  const VerifyResetCodeResponseDto({this.status});

  factory VerifyResetCodeResponseDto.fromJson(Map<String, dynamic> json) =>
      _$VerifyResetCodeResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyResetCodeResponseDtoToJson(this);

  VerifyResetCodeResponseEntity toDomain() =>
      VerifyResetCodeResponseEntity(status: status);
}
