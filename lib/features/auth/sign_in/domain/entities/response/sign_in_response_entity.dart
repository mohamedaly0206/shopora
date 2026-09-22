import 'package:equatable/equatable.dart';
import 'package:shopora/core/models/user_model/user_entity.dart';

class SignInResponseEntity extends Equatable {
  final String? message;
  final UserEntity? user;
  final String? token;
  const SignInResponseEntity({this.message, this.user, this.token});
  @override
  List<Object?> get props => [message, user, token];
}
