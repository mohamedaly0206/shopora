// To parse this JSON data, do
//
//     final signInResponse = signInResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:shopora/core/models/user_model/user_dto.dart';
import 'package:shopora/features/auth/sign_in/domain/entities/response/sign_in_response_entity.dart';

part 'sign_in_response_dto.g.dart';

SignInResponseDto signInResponseFromJson(String str) =>
    SignInResponseDto.fromJson(json.decode(str));

String signInResponseToJson(SignInResponseDto data) =>
    json.encode(data.toJson());

@JsonSerializable()
class SignInResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final UserDto? user;
  @JsonKey(name: "token")
  final String? token;

  SignInResponseDto({this.message, this.user, this.token});

  factory SignInResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseDtoToJson(this);

  SignInResponseEntity toDomain() {
    return SignInResponseEntity(
      message: message ?? '',
      user: user?.toDomain(),
      token: token ?? '',
    );
  }
}
