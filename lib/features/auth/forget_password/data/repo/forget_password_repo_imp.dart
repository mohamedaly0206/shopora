import 'package:injectable/injectable.dart';
import 'package:shopora/config/base_response/base_response.dart';
import 'package:shopora/features/auth/forget_password/data/data_source/forget_password_remote_data_source_contract.dart';
import 'package:shopora/features/auth/forget_password/data/models/request/forget_password_request_dto.dart';
import 'package:shopora/features/auth/forget_password/data/models/request/reset_password_request_dto.dart';
import 'package:shopora/features/auth/forget_password/data/models/request/verify_reset_code_request_dto.dart';
import 'package:shopora/features/auth/forget_password/data/models/response/forget_password_response_dto.dart';
import 'package:shopora/features/auth/forget_password/data/models/response/reset_password_response_dto.dart';
import 'package:shopora/features/auth/forget_password/data/models/response/verify_reset_code_response_dto.dart';
import 'package:shopora/features/auth/forget_password/domain/entities/request/forget_password_request_entity.dart';
import 'package:shopora/features/auth/forget_password/domain/entities/request/reset_password_request_entity.dart';
import 'package:shopora/features/auth/forget_password/domain/entities/request/verify_reset_code_request_entity.dart';
import 'package:shopora/features/auth/forget_password/domain/entities/response/forget_password_response_entity.dart';
import 'package:shopora/features/auth/forget_password/domain/entities/response/reset_password_response_entity.dart';
import 'package:shopora/features/auth/forget_password/domain/entities/response/verify_reset_code_response_entity.dart';
import 'package:shopora/features/auth/forget_password/domain/repo/forget_password_repo_contract.dart';

@Injectable(as: ForgetPasswordRepoContract)
class ForgetPasswordRepoImp implements ForgetPasswordRepoContract {
  final ForgetPasswordRemoteDataSourceContract _remoteDataSource;

  ForgetPasswordRepoImp(this._remoteDataSource);

  @override
  Future<BaseResponse<ForgetPasswordResponseEntity>> forgetPassword({
    required ForgetPasswordRequestEntity forgetPasswordRequestEntity,
  }) async {
    final response = await _remoteDataSource.forgetPassword(
      request: ForgetPasswordRequestDto.fromDomain(forgetPasswordRequestEntity),
    );
    switch (response) {
      case SuccessBaseResponse<ForgetPasswordResponseDto> successResponse:
        return SuccessBaseResponse(data: successResponse.data.toDomain());
      case ErrorBaseResponse<ForgetPasswordResponseDto> errorResponse:
        return ErrorBaseResponse(errorMessage: errorResponse.errorMessage);
    }
  }

  @override
  Future<BaseResponse<ResetPasswordResponseEntity>> resetPassword({
    required ResetPasswordRequestEntity resetPasswordRequestEntity,
  }) async {
    final response = await _remoteDataSource.resetPassword(
      request: ResetPasswordRequestDto.fromDomain(resetPasswordRequestEntity),
    );
    switch (response) {
      case SuccessBaseResponse<ResetPasswordResponseDto> successResponse:
        return SuccessBaseResponse(data: successResponse.data.toDomain());
      case ErrorBaseResponse<ResetPasswordResponseDto> errorResponse:
        return ErrorBaseResponse(errorMessage: errorResponse.errorMessage);
    }
  }

  @override
  Future<BaseResponse<VerifyResetCodeResponseEntity>> verifyResetCode({
    required VerifyResetCodeRequestEntity verifyResetCodeRequestEntity,
  }) async {
    final response = await _remoteDataSource.verifyResetCode(
      request: VerifyResetCodeRequestDto.fromDomain(
        verifyResetCodeRequestEntity,
      ),
    );
    switch (response) {
      case SuccessBaseResponse<VerifyResetCodeResponseDto> successResponse:
        return SuccessBaseResponse(data: successResponse.data.toDomain());
      case ErrorBaseResponse<VerifyResetCodeResponseDto> errorResponse:
        return ErrorBaseResponse(errorMessage: errorResponse.errorMessage);
    }
  }
}
