import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopora/config/base_response/base_response.dart';
import 'package:shopora/config/base_state/base_state.dart';
import 'package:shopora/features/auth/forget_password/domain/entities/request/forget_password_request_entity.dart';
import 'package:shopora/features/auth/forget_password/domain/entities/request/reset_password_request_entity.dart';
import 'package:shopora/features/auth/forget_password/domain/entities/request/verify_reset_code_request_entity.dart';
import 'package:shopora/features/auth/forget_password/domain/entities/response/forget_password_response_entity.dart';
import 'package:shopora/features/auth/forget_password/domain/entities/response/reset_password_response_entity.dart';
import 'package:shopora/features/auth/forget_password/domain/entities/response/verify_reset_code_response_entity.dart';
import 'package:shopora/features/auth/forget_password/domain/use_cases/forget_password_use_case.dart';
import 'package:shopora/features/auth/forget_password/domain/use_cases/reset_password_use_case.dart';
import 'package:shopora/features/auth/forget_password/domain/use_cases/verify_reset_code_use_case.dart';
import 'package:shopora/features/auth/forget_password/presentation/cubit/forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final VerifyResetCodeUseCase _verifyResetCodeUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;

  ForgetPasswordCubit(
    this._forgetPasswordUseCase,
    this._verifyResetCodeUseCase,
    this._resetPasswordUseCase,
  ) : super(const ForgetPasswordState());

  void updateCurrentPage(int page) {
    emit(
      state.copyWith(
        currentPage: page,
      ),
    );
  }

  void updateEmail(String email) {
    emit(
      state.copyWith(
        email: email,
      ),
    );
  }

  void clearVerifyResetCodeState() {
    emit(
      state.copyWith(
        verifyResetCodeState: const BaseState(),
      ),
    );
  }

  Future<void> forgetPassword() async {
    emit(
      state.copyWith(
        forgetPasswordState: const BaseState(
          isLoading: true,
        ),
      ),
    );

    final response = await _forgetPasswordUseCase.call(
      forgetPasswordRequestEntity: ForgetPasswordRequestEntity(
        email: state.email,
      ),
    );

    if (response is SuccessBaseResponse<ForgetPasswordResponseEntity>) {
      emit(
        state.copyWith(
          forgetPasswordState: BaseState(
            isLoading: false,
            data: response.data,
          ),
          currentPage: 1,
        ),
      );
    } else if (response
        is ErrorBaseResponse<ForgetPasswordResponseEntity>) {
      emit(
        state.copyWith(
          forgetPasswordState: BaseState(
            isLoading: false,
            errorMessage: response.errorMessage,
          ),
        ),
      );
    }
  }

  Future<void> verifyResetCode(String code) async {
    emit(
      state.copyWith(
        verifyResetCodeState: const BaseState(
          isLoading: true,
        ),
      ),
    );

    final response = await _verifyResetCodeUseCase.call(
      verifyResetCodeRequestEntity: VerifyResetCodeRequestEntity(
        resetCode: code,
      ),
    );

    if (response
        is SuccessBaseResponse<VerifyResetCodeResponseEntity>) {
      emit(
        state.copyWith(
          verifyResetCodeState: BaseState(
            isLoading: false,
            data: response.data,
          ),
          currentPage: 2,
        ),
      );
    } else if (response
        is ErrorBaseResponse<VerifyResetCodeResponseEntity>) {
      emit(
        state.copyWith(
          verifyResetCodeState: BaseState(
            isLoading: false,
            errorMessage: response.errorMessage,
          ),
        ),
      );
    }
  }

  Future<void> resetPassword(String newPassword) async {
    emit(
      state.copyWith(
        resetPasswordState: const BaseState(
          isLoading: true,
        ),
      ),
    );

    final response = await _resetPasswordUseCase.call(
      resetPasswordRequestEntity: ResetPasswordRequestEntity(
        email: state.email,
        newPassword: newPassword,
      ),
    );

    if (response
        is SuccessBaseResponse<ResetPasswordResponseEntity>) {
      emit(
        state.copyWith(
          resetPasswordState: BaseState(
            isLoading: false,
            data: response.data,
          ),
        ),
      );
    } else if (response
        is ErrorBaseResponse<ResetPasswordResponseEntity>) {
      emit(
        state.copyWith(
          resetPasswordState: BaseState(
            isLoading: false,
            errorMessage: response.errorMessage,
          ),
        ),
      );
    }
  }
}