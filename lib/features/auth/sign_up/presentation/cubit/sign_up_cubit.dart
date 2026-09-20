import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopora/config/base_response/base_response.dart';
import 'package:shopora/config/base_state/base_state.dart';
import 'package:shopora/features/auth/sign_up/data/models/request/sign_up_data_request.dart';
import 'package:shopora/features/auth/sign_up/data/models/response/sign_up_response.dart';
import 'package:shopora/features/auth/sign_up/data/repo/sign_up_repo_contract.dart';
import 'package:shopora/features/auth/sign_up/presentation/cubit/sign_up_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepoContract _signUpRepoContract;
  SignUpCubit(this._signUpRepoContract) : super(const SignUpState());

  void toggleAgreeTerms(bool value) {
    emit(state.copyWith(agreeTerms: value));
  }

  Future<void> signUp({required SignUpDataRequest signUpDataRequest}) async {
    emit(state.copyWith(signUpState: const BaseState(isLoading: true)));
    final response = await _signUpRepoContract.signUp(
      signUpDataRequest: signUpDataRequest,
    );
    switch (response) {
      case SuccessBaseResponse<SignupResponse>():
        emit(state.copyWith(signUpState: BaseState(data: response.data)));
        break;
      case ErrorBaseResponse<SignupResponse>():
        emit(
          state.copyWith(
            signUpState: BaseState(errorMessage: response.errorMessage),
          ),
        );
        break;
    }
  }
}
