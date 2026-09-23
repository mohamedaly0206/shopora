import 'package:injectable/injectable.dart';
import 'package:shopora/config/base_response/base_response.dart';
import 'package:shopora/core/errors/failures.dart';
import 'package:shopora/features/auth/forget_password/data/api_client/forget_password_api_client.dart';
import 'package:shopora/features/auth/forget_password/data/data_source/forget_password_remote_data_source_contract.dart';
import 'package:shopora/features/auth/forget_password/data/models/request/forget_password_request_dto.dart';
import 'package:shopora/features/auth/forget_password/data/models/request/reset_password_request_dto.dart';
import 'package:shopora/features/auth/forget_password/data/models/request/verify_reset_code_request_dto.dart';
import 'package:shopora/features/auth/forget_password/data/models/response/forget_password_response_dto.dart';
import 'package:shopora/features/auth/forget_password/data/models/response/reset_password_response_dto.dart';
import 'package:shopora/features/auth/forget_password/data/models/response/verify_reset_code_response_dto.dart';

@Injectable(as: ForgetPasswordRemoteDataSourceContract)
class ForgetPasswordRemoteDataSourceImp
    implements ForgetPasswordRemoteDataSourceContract {
  final ForgetPasswordApiClient _apiClient;

  ForgetPasswordRemoteDataSourceImp(this._apiClient);

  @override
  Future<BaseResponse<ForgetPasswordResponseDto>> forgetPassword({
    required ForgetPasswordRequestDto request,
  }) async {
    try {
      final response = await _apiClient.forgetPassword(request);
      return SuccessBaseResponse(data: response);
    } catch (e) {
      return ErrorBaseResponse(
        errorMessage: ServerFailure.failureHandler(e).errorMessage,
      );
    }
  }

  @override
  Future<BaseResponse<ResetPasswordResponseDto>> resetPassword({
    required ResetPasswordRequestDto request,
  }) async {
    try {
      final response = await _apiClient.resetPassword(request);
      return SuccessBaseResponse(data: response);
    } catch (e) {
      return ErrorBaseResponse(
        errorMessage: ServerFailure.failureHandler(e).errorMessage,
      );
    }
  }

  @override
  Future<BaseResponse<VerifyResetCodeResponseDto>> verifyResetCode({
    required VerifyResetCodeRequestDto request,
  }) async {
    try {
      final response = await _apiClient.verifyResetCode(request);
      return SuccessBaseResponse(data: response);
    } catch (e) {
      return ErrorBaseResponse(
        errorMessage: ServerFailure.failureHandler(e).errorMessage,
      );
    }
  }
}
