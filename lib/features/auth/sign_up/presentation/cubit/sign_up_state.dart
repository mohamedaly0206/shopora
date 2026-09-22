import 'package:equatable/equatable.dart';
import 'package:shopora/config/base_state/base_state.dart';
import 'package:shopora/features/auth/sign_up/domain/entities/response/sign_up_response_entity.dart';

class SignUpState extends Equatable {
  final BaseState<SignUpResponseEntity> signUpState;
  final bool agreeTerms;

  const SignUpState({
    this.signUpState = const BaseState<SignUpResponseEntity>(),
    this.agreeTerms = false,
  });

  SignUpState copyWith({
    BaseState<SignUpResponseEntity>? signUpState,
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
