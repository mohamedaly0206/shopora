import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

import 'package:shopora/features/auth/sign_up/data/models/response/user.dart';

part 'sign_up_response.g.dart';


@JsonSerializable()
class Signup {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final User? user;
  @JsonKey(name: "token")
  final String? token;

  Signup({this.message, this.user, this.token});

  factory Signup.fromJson(Map<String, dynamic> json) => _$SignupFromJson(json);

  Map<String, dynamic> toJson() => _$SignupToJson(this);
}
