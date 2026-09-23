import 'package:equatable/equatable.dart';

class ResetPasswordResponseEntity extends Equatable {
  final String? token;

  const ResetPasswordResponseEntity({
    this.token,
  });

  @override
  List<Object?> get props => [token];
}
