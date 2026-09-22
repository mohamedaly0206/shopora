import 'package:equatable/equatable.dart';
import 'package:shopora/config/base_state/base_state.dart';
import 'package:shopora/features/auth/sign_in/domain/entities/response/sign_in_response_entity.dart';

class SignInState extends Equatable {
  final BaseState<SignInResponseEntity> signInState;
  final bool rememberMe;

  const SignInState({
    this.signInState = const BaseState<SignInResponseEntity>(),
    this.rememberMe = false,
  });

  SignInState copyWith({
    BaseState<SignInResponseEntity>? signInState,
    bool? rememberMe,
  }) {
    return SignInState(
      signInState: signInState ?? this.signInState,
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }

  @override
  List<Object> get props => [signInState, rememberMe];
}
