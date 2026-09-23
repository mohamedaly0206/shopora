import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shopora/core/values/api_endpoints.dart';
import 'package:shopora/features/auth/forget_password/data/models/request/forget_password_request_dto.dart';
import 'package:shopora/features/auth/forget_password/data/models/request/reset_password_request_dto.dart';
import 'package:shopora/features/auth/forget_password/data/models/request/verify_reset_code_request_dto.dart';
import 'package:shopora/features/auth/forget_password/data/models/response/forget_password_response_dto.dart';
import 'package:shopora/features/auth/forget_password/data/models/response/reset_password_response_dto.dart';
import 'package:shopora/features/auth/forget_password/data/models/response/verify_reset_code_response_dto.dart';

@lazySingleton
class ForgetPasswordApiClient {
  final Dio _dio;

  ForgetPasswordApiClient(this._dio);

  Future<ForgetPasswordResponseDto> forgetPassword(
    ForgetPasswordRequestDto request,
  ) async {
    final response = await _dio.post(
      ApiEndpoints.forgetPassword,
      data: request.toJson(),
    );
    return ForgetPasswordResponseDto.fromJson(response.data);
  }

  Future<VerifyResetCodeResponseDto> verifyResetCode(
    VerifyResetCodeRequestDto request,
  ) async {
    final response = await _dio.post(
      ApiEndpoints.verifyResetCode,
      data: request.toJson(),
    );
    return VerifyResetCodeResponseDto.fromJson(response.data);
  }

  Future<ResetPasswordResponseDto> resetPassword(
    ResetPasswordRequestDto request,
  ) async {
    final response = await _dio.put(
      ApiEndpoints.resetPassword,
      data: request.toJson(),
    );
    return ResetPasswordResponseDto.fromJson(response.data);
  }
}
