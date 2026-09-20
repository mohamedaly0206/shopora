import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shopora/config/base_response/base_response.dart';
import 'package:shopora/config/security_storage/security_storage.dart';
import 'package:shopora/core/errors/failures.dart';
import 'package:shopora/core/values/api_endpoints.dart';
import 'package:shopora/features/auth/sign_up/data/models/request/sign_up_data_request.dart';
import 'package:shopora/features/auth/sign_up/data/models/response/sign_up_response.dart';
import 'package:shopora/features/auth/sign_up/data/repo/sign_up_repo_contract.dart';

@Injectable(as: SignUpRepoContract)
class SignUpRepoImp implements SignUpRepoContract {
  final Dio _dio;

  SignUpRepoImp(this._dio);
  @override
  Future<BaseResponse<SignupResponse>> signUp({
    required SignUpDataRequest signUpDataRequest,
  }) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.signUp,
        data: signUpDataRequest.toJson(),
      );
      return SuccessBaseResponse<SignupResponse>(
        data: SignupResponse.fromJson(response.data),
      );
    } catch (e) {
      return ErrorBaseResponse<SignupResponse>(
        errorMessage: ServerFailure.failureHandler(e).errorMessage,
      );
    }
  }
}
