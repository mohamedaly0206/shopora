import 'package:equatable/equatable.dart';
import 'package:shopora/config/base_state/base_state.dart';
import 'package:shopora/features/auth/sign_in/data/models/response/sign_in_response.dart';

class SignInState extends Equatable {
  final BaseState<SignInResponse> signInState;
  final bool rememberMe;

  const SignInState({
    this.signInState = const BaseState<SignInResponse>(),
    this.rememberMe = false,
  });

  SignInState copyWith({
    BaseState<SignInResponse>? signInState,
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
