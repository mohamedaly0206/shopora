import 'package:equatable/equatable.dart';
import 'package:shopora/config/base_state/base_state.dart';
import 'package:shopora/features/auth/forget_password/domain/entities/response/forget_password_response_entity.dart';
import 'package:shopora/features/auth/forget_password/domain/entities/response/reset_password_response_entity.dart';
import 'package:shopora/features/auth/forget_password/domain/entities/response/verify_reset_code_response_entity.dart';

class ForgetPasswordState extends Equatable {
  final BaseState<ForgetPasswordResponseEntity> forgetPasswordState;
  final BaseState<VerifyResetCodeResponseEntity> verifyResetCodeState;
  final BaseState<ResetPasswordResponseEntity> resetPasswordState;
  final int currentPage;
  final String email;

  const ForgetPasswordState({
    this.forgetPasswordState = const BaseState<ForgetPasswordResponseEntity>(),
    this.verifyResetCodeState = const BaseState<VerifyResetCodeResponseEntity>(),
    this.resetPasswordState = const BaseState<ResetPasswordResponseEntity>(),
    this.currentPage = 0,
    this.email = '',
  });

  ForgetPasswordState copyWith({
    BaseState<ForgetPasswordResponseEntity>? forgetPasswordState,
    BaseState<VerifyResetCodeResponseEntity>? verifyResetCodeState,
    BaseState<ResetPasswordResponseEntity>? resetPasswordState,
    int? currentPage,
    String? email,
  }) {
    return ForgetPasswordState(
      forgetPasswordState: forgetPasswordState ?? this.forgetPasswordState,
      verifyResetCodeState: verifyResetCodeState ?? this.verifyResetCodeState,
      resetPasswordState: resetPasswordState ?? this.resetPasswordState,
      currentPage: currentPage ?? this.currentPage,
      email: email ?? this.email,
    );
  }

  @override
  List<Object> get props => [
        forgetPasswordState,
        verifyResetCodeState,
        resetPasswordState,
        currentPage,
        email,
      ];
}
