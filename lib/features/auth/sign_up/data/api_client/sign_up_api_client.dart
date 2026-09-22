import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shopora/core/values/api_endpoints.dart';
import 'package:shopora/features/auth/sign_up/data/models/request/sign_up_data_request.dart';
import 'package:shopora/features/auth/sign_up/data/models/response/sign_up_response.dart';

@lazySingleton
class SignUpApiClient {
  final Dio _dio;

  SignUpApiClient(this._dio);

  Future<SignupResponse> signUp(SignUpDataRequest signUpDataRequest) async {
    final response = await _dio.post(
      ApiEndpoints.signUp,
      data: signUpDataRequest.toJson(),
    );

    return SignupResponse.fromJson(response.data);
  }
}
