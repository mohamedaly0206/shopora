import 'package:json_annotation/json_annotation.dart';
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
}
