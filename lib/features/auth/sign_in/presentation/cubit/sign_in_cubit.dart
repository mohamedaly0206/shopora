import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopora/config/base_response/base_response.dart';
import 'package:shopora/config/base_state/base_state.dart';
import 'package:shopora/features/auth/sign_in/data/models/request/sign_in_data_request.dart';
import 'package:shopora/features/auth/sign_in/data/models/response/sign_in_response.dart';
import 'package:shopora/features/auth/sign_in/data/repo/sign_in_repo_contract.dart';
import 'package:shopora/features/auth/sign_in/presentation/cubit/sign_in_state.dart';
import 'package:shopora/config/security_storage/security_storage.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  final SignInRepoContract _signInRepoContract;
  final SecurityStorage _securityStorage;

  SignInCubit(this._signInRepoContract, this._securityStorage)
    : super(const SignInState());

  void toggleRememberMe(bool value) {
    emit(state.copyWith(rememberMe: value));
  }

  Future<void> signIn({required SignInDataRequest signInDataRequest}) async {
    emit(state.copyWith(signInState: const BaseState(isLoading: true)));
    final response = await _signInRepoContract.signIn(
      signInDataRequest: signInDataRequest,
    );
    switch (response) {
      case SuccessBaseResponse<SignInResponse>():
        final token = response.data?.token;
        if (token != null) {
          await _securityStorage.setSecuredString('token', token);
        }
        emit(state.copyWith(signInState: BaseState(data: response.data)));
        break;
      case ErrorBaseResponse<SignInResponse>():
        emit(
          state.copyWith(
            signInState: BaseState(errorMessage: response.errorMessage),
          ),
        );
        break;
    }
  }
}
