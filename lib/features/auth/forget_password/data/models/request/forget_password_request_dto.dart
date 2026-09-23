import 'package:json_annotation/json_annotation.dart';
import 'package:shopora/features/auth/forget_password/domain/entities/request/forget_password_request_entity.dart';

part 'forget_password_request_dto.g.dart';

@JsonSerializable()
class ForgetPasswordRequestDto {
  final String? email;

  const ForgetPasswordRequestDto({this.email});

  factory ForgetPasswordRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordRequestDtoToJson(this);

  factory ForgetPasswordRequestDto.fromDomain(
          ForgetPasswordRequestEntity entity) =>
      ForgetPasswordRequestDto(
        email: entity.email,
      );
}
