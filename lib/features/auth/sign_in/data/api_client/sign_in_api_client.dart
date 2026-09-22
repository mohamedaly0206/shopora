import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shopora/core/values/api_endpoints.dart';
import 'package:shopora/features/auth/sign_in/data/models/request/sign_in_data_request_dto.dart';
import 'package:shopora/features/auth/sign_in/data/models/response/sign_in_response_dto.dart';

@lazySingleton
class SignInApiClient {
  final Dio _dio;

  SignInApiClient(this._dio);

  Future<SignInResponseDto> signIn(
    SignInDataRequestDto signInDataRequest,
  ) async {
    final response = await _dio.post(
      ApiEndpoints.login,
      data: signInDataRequest.toJson(),
    );

    return SignInResponseDto.fromJson(response.data);
  }
}
