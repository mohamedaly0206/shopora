import 'package:equatable/equatable.dart';

class ForgetPasswordResponseEntity extends Equatable {
  final String? statusMsg;
  final String? message;

  const ForgetPasswordResponseEntity({this.statusMsg, this.message});

  @override
  List<Object?> get props => [statusMsg, message];
}
