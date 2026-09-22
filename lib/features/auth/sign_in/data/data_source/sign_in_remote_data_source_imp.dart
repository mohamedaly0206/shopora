import 'package:injectable/injectable.dart';
import 'package:shopora/config/base_response/base_response.dart';
import 'package:shopora/core/errors/failures.dart';
import 'package:shopora/features/auth/sign_in/data/api_client/sign_in_api_client.dart';
import 'package:shopora/features/auth/sign_in/data/data_source/sign_in_remote_data_source_contract.dart';
import 'package:shopora/features/auth/sign_in/data/models/request/sign_in_data_request_dto.dart';
import 'package:shopora/features/auth/sign_in/data/models/response/sign_in_response_dto.dart';

@Injectable(as: SignInRemoteDataSourceContract)
class SignInRemoteDataSourceImp implements SignInRemoteDataSourceContract {
  final SignInApiClient _signInApiClient;
  SignInRemoteDataSourceImp(this._signInApiClient);
  @override
  Future<BaseResponse<SignInResponseDto>> signIn({
    required SignInDataRequestDto signInDataRequest,
  }) async {
    try {
      final response = await _signInApiClient.signIn(signInDataRequest);
      return SuccessBaseResponse<SignInResponseDto>(data: response);
    } catch (e) {
      return ErrorBaseResponse<SignInResponseDto>(
        errorMessage: ServerFailure.failureHandler(e).errorMessage,
      );
    }
  }
}
