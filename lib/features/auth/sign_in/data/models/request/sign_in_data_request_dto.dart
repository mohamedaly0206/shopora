// To parse this JSON data, do
//
//     final signInDataRequest = signInDataRequestFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:shopora/features/auth/sign_in/domain/entities/request/sign_in_data_request_entity.dart';

part 'sign_in_data_request_dto.g.dart';

SignInDataRequestDto signInDataRequestFromJson(String str) =>
    SignInDataRequestDto.fromJson(json.decode(str));

String signInDataRequestToJson(SignInDataRequestDto data) =>
    json.encode(data.toJson());

@JsonSerializable()
class SignInDataRequestDto {
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "password")
  final String? password;

  SignInDataRequestDto({this.email, this.password});

  factory SignInDataRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SignInDataRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SignInDataRequestDtoToJson(this);

  factory SignInDataRequestDto.fromDomain(SignInDataRequestEntity entity) {
    return SignInDataRequestDto(email: entity.email, password: entity.password);
  }
}
