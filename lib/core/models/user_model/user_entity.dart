import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? name;
  final String? email;
  final String? role;

  const UserEntity({this.name, this.email, this.role});

  @override
  List<Object?> get props => [name, email, role];
}
