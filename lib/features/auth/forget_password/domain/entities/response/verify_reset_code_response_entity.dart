import 'package:equatable/equatable.dart';

class VerifyResetCodeResponseEntity extends Equatable {
  final String? status;

  const VerifyResetCodeResponseEntity({
    this.status,
  });

  @override
  List<Object?> get props => [status];
}
