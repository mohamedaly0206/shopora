import 'package:json_annotation/json_annotation.dart';
import 'package:shopora/core/models/user_model/user_entity.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "role")
  final String? role;

  UserDto({this.name, this.email, this.role});

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
  UserEntity toDomain() {
    return UserEntity(name: name ?? '', email: email ?? '', role: role ?? '');
  }
}
