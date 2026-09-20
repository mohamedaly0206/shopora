import 'package:json_annotation/json_annotation.dart';
import 'package:shopora/core/models/user.dart';
part 'sign_up_response.g.dart';

@JsonSerializable()
class SignupResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final User? user;
  @JsonKey(name: "token")
  final String? token;

  SignupResponse({this.message, this.user, this.token});

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseToJson(this);
}
