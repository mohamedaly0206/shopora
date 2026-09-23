import 'package:shopora/config/base_response/base_response.dart';
import 'package:shopora/features/auth/forget_password/data/models/request/forget_password_request_dto.dart';
import 'package:shopora/features/auth/forget_password/data/models/request/reset_password_request_dto.dart';
import 'package:shopora/features/auth/forget_password/data/models/request/verify_reset_code_request_dto.dart';
import 'package:shopora/features/auth/forget_password/data/models/response/forget_password_response_dto.dart';
import 'package:shopora/features/auth/forget_password/data/models/response/reset_password_response_dto.dart';
import 'package:shopora/features/auth/forget_password/data/models/response/verify_reset_code_response_dto.dart';

abstract class ForgetPasswordRemoteDataSourceContract {
  Future<BaseResponse<ForgetPasswordResponseDto>> forgetPassword({
    required ForgetPasswordRequestDto request,
  });

  Future<BaseResponse<VerifyResetCodeResponseDto>> verifyResetCode({
    required VerifyResetCodeRequestDto request,
  });

  Future<BaseResponse<ResetPasswordResponseDto>> resetPassword({
    required ResetPasswordRequestDto request,
  });
}
