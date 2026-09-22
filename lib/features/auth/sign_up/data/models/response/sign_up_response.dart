import 'package:json_annotation/json_annotation.dart';
import 'package:shopora/core/models/user_model/user_dto.dart';
import 'package:shopora/features/auth/sign_up/domain/entities/response/sign_up_response_entity.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignupResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final UserDto? user;
  @JsonKey(name: "token")
  final String? token;

  SignupResponse({this.message, this.user, this.token});

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseToJson(this);

  SignUpResponseEntity toDomain() {
    return SignUpResponseEntity(
      message: message ?? '',
      user: user?.toDomain(),
      token: token ?? '',
    );
  }
}
