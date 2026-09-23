import 'package:json_annotation/json_annotation.dart';
import 'package:shopora/features/auth/forget_password/domain/entities/response/forget_password_response_entity.dart';

part 'forget_password_response_dto.g.dart';

@JsonSerializable()
class ForgetPasswordResponseDto {
  final String? statusMsg;
  final String? message;

  const ForgetPasswordResponseDto({this.statusMsg, this.message});

  factory ForgetPasswordResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordResponseDtoToJson(this);

  ForgetPasswordResponseEntity toDomain() =>
      ForgetPasswordResponseEntity(statusMsg: statusMsg, message: message);
}
