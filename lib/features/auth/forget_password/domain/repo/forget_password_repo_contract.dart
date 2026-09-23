import 'package:shopora/config/base_response/base_response.dart';
import 'package:shopora/features/auth/forget_password/domain/entities/request/forget_password_request_entity.dart';
import 'package:shopora/features/auth/forget_password/domain/entities/request/reset_password_request_entity.dart';
import 'package:shopora/features/auth/forget_password/domain/entities/request/verify_reset_code_request_entity.dart';
import 'package:shopora/features/auth/forget_password/domain/entities/response/forget_password_response_entity.dart';
import 'package:shopora/features/auth/forget_password/domain/entities/response/reset_password_response_entity.dart';
import 'package:shopora/features/auth/forget_password/domain/entities/response/verify_reset_code_response_entity.dart';

abstract class ForgetPasswordRepoContract {
  Future<BaseResponse<ForgetPasswordResponseEntity>> forgetPassword({
    required ForgetPasswordRequestEntity forgetPasswordRequestEntity,
  });

  Future<BaseResponse<VerifyResetCodeResponseEntity>> verifyResetCode({
    required VerifyResetCodeRequestEntity verifyResetCodeRequestEntity,
  });

  Future<BaseResponse<ResetPasswordResponseEntity>> resetPassword({
    required ResetPasswordRequestEntity resetPasswordRequestEntity,
  });
}
