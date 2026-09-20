import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shopora/config/base_response/base_response.dart';
import 'package:shopora/core/errors/failures.dart';
import 'package:shopora/core/values/api_endpoints.dart';
import 'package:shopora/features/auth/sign_in/data/models/request/sign_in_data_request.dart';
import 'package:shopora/features/auth/sign_in/data/models/response/sign_in_response.dart';
import 'package:shopora/features/auth/sign_in/data/repo/sign_in_repo_contract.dart';

@Injectable(as: SignInRepoContract)
class SignInRepoImp implements SignInRepoContract {
  final Dio _dio;

  SignInRepoImp(this._dio);

  @override
  Future<BaseResponse<SignInResponse>> signIn({
    required SignInDataRequest signInDataRequest,
  }) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.login,
        data: signInDataRequest.toJson(),
      );
      return SuccessBaseResponse<SignInResponse>(
        data: SignInResponse.fromJson(response.data),
      );
    } catch (e) {
      return ErrorBaseResponse<SignInResponse>(
        errorMessage: ServerFailure.failureHandler(e).errorMessage,
      );
    }
  }
}
