import 'package:injectable/injectable.dart';
import 'package:shopora/config/base_response/base_response.dart';
import 'package:shopora/core/errors/failures.dart';
import 'package:shopora/features/auth/sign_up/data/api_client/sign_up_api_client.dart';
import 'package:shopora/features/auth/sign_up/data/data_source/sign_up_remote_data_source_contract.dart';
import 'package:shopora/features/auth/sign_up/data/models/request/sign_up_data_request.dart';
import 'package:shopora/features/auth/sign_up/data/models/response/sign_up_response.dart';

@Injectable(as: SignUpRemoteDataSourceContract)
class SignUpRemoteDataSourceImp implements SignUpRemoteDataSourceContract {
  final SignUpApiClient _signUpApiClient;

  SignUpRemoteDataSourceImp(this._signUpApiClient);

  @override
  Future<BaseResponse<SignupResponse>> signUp({
    required SignUpDataRequest signUpDataRequest,
  }) async {
    try {
      final response = await _signUpApiClient.signUp(signUpDataRequest);
      return SuccessBaseResponse<SignupResponse>(data: response);
    } catch (e) {
      return ErrorBaseResponse<SignupResponse>(
        errorMessage: ServerFailure.failureHandler(e).errorMessage,
      );
    }
  }
}
