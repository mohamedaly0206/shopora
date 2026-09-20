// To parse this JSON data, do
//
//     final signInDataRequest = signInDataRequestFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'sign_in_data_request.g.dart';

SignInDataRequest signInDataRequestFromJson(String str) =>
    SignInDataRequest.fromJson(json.decode(str));

String signInDataRequestToJson(SignInDataRequest data) =>
    json.encode(data.toJson());

@JsonSerializable()
class SignInDataRequest {
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "password")
  final String? password;

  SignInDataRequest({this.email, this.password});

  factory SignInDataRequest.fromJson(Map<String, dynamic> json) =>
      _$SignInDataRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignInDataRequestToJson(this);
}
