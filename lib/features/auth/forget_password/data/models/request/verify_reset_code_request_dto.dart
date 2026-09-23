import 'package:json_annotation/json_annotation.dart';
import 'package:shopora/features/auth/forget_password/domain/entities/request/verify_reset_code_request_entity.dart';

part 'verify_reset_code_request_dto.g.dart';

@JsonSerializable()
class VerifyResetCodeRequestDto {
  final String? resetCode;

  const VerifyResetCodeRequestDto({this.resetCode});

  factory VerifyResetCodeRequestDto.fromJson(Map<String, dynamic> json) =>
      _$VerifyResetCodeRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyResetCodeRequestDtoToJson(this);

  factory VerifyResetCodeRequestDto.fromDomain(
    VerifyResetCodeRequestEntity entity,
  ) => VerifyResetCodeRequestDto(resetCode: entity.resetCode);
}
