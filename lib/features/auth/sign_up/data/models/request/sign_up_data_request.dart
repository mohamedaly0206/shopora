import 'package:json_annotation/json_annotation.dart';

import 'package:shopora/features/auth/sign_up/domain/entities/request/sign_up_data_request_entity.dart';

part 'sign_up_data_request.g.dart';

@JsonSerializable()
class SignUpDataRequest {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "rePassword")
  final String? rePassword;
  @JsonKey(name: "phone")
  final String? phone;

  SignUpDataRequest({
    this.name,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
  });

  factory SignUpDataRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpDataRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpDataRequestToJson(this);

  factory SignUpDataRequest.fromDomain(SignUpDataRequestEntity entity) {
    return SignUpDataRequest(
      name: entity.name,
      email: entity.email,
      password: entity.password,
      rePassword: entity.rePassword,
      phone: entity.phone,
    );
  }
}
