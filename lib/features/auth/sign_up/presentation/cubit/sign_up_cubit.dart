import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopora/config/base_response/base_response.dart';
import 'package:shopora/config/base_state/base_state.dart';
import 'package:shopora/features/auth/sign_up/domain/entities/request/sign_up_data_request_entity.dart';
import 'package:shopora/features/auth/sign_up/domain/entities/response/sign_up_response_entity.dart';
import 'package:shopora/features/auth/sign_up/domain/use_cases/sign_up_use_case.dart';
import 'package:shopora/features/auth/sign_up/presentation/cubit/sign_up_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase _signUpUseCase;

  SignUpCubit(this._signUpUseCase) : super(const SignUpState());

  void toggleAgreeTerms(bool value) {
    emit(state.copyWith(agreeTerms: value));
  }

  Future<void> signUp({
    required SignUpDataRequestEntity signUpDataRequest,
  }) async {
    emit(state.copyWith(signUpState: const BaseState(isLoading: true)));
    final response = await _signUpUseCase.call(
      signUpDataRequest: signUpDataRequest,
    );
    switch (response) {
      case SuccessBaseResponse<SignUpResponseEntity>():
        emit(state.copyWith(signUpState: BaseState(data: response.data)));
        break;
      case ErrorBaseResponse<SignUpResponseEntity>():
        emit(
          state.copyWith(
            signUpState: BaseState(errorMessage: response.errorMessage),
          ),
        );
        break;
    }
  }
}
