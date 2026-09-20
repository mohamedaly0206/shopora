import 'package:equatable/equatable.dart';
import 'package:shopora/config/base_state/base_state.dart';
import 'package:shopora/features/auth/sign_up/data/models/response/sign_up_response.dart';

class SignUpState extends Equatable {
  final BaseState<SignupResponse> signUpState;
  final bool agreeTerms;

  const SignUpState({
    this.signUpState = const BaseState<SignupResponse>(),
    this.agreeTerms = false,
  });

  SignUpState copyWith({
    BaseState<SignupResponse>? signUpState,
    bool? agreeTerms,
  }) {
    return SignUpState(
      signUpState: signUpState ?? this.signUpState,
      agreeTerms: agreeTerms ?? this.agreeTerms,
    );
  }

  @override
  List<Object> get props => [signUpState, agreeTerms];
}
