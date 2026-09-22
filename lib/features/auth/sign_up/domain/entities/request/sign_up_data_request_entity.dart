import 'package:equatable/equatable.dart';

class SignUpDataRequestEntity extends Equatable {
  final String name;
  final String email;
  final String password;
  final String rePassword;
  final String phone;

  const SignUpDataRequestEntity({
    required this.name,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone,
  });

  @override
  List<Object?> get props => [name, email, password, rePassword, phone];
}
