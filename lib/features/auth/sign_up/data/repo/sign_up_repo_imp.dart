import 'package:injectable/injectable.dart';
import 'package:shopora/config/base_response/base_response.dart';
import 'package:shopora/features/auth/sign_up/data/data_source/sign_up_remote_data_source_contract.dart';
import 'package:shopora/features/auth/sign_up/data/models/request/sign_up_data_request.dart';
import 'package:shopora/features/auth/sign_up/data/models/response/sign_up_response.dart';
import 'package:shopora/features/auth/sign_up/domain/entities/request/sign_up_data_request_entity.dart';
import 'package:shopora/features/auth/sign_up/domain/entities/response/sign_up_response_entity.dart';
import 'package:shopora/features/auth/sign_up/domain/repo/sign_up_repo_contract.dart';

@Injectable(as: SignUpRepoContract)
class SignUpRepoImp implements SignUpRepoContract {
  final SignUpRemoteDataSourceContract _signUpRemoteDataSourceImp;

  SignUpRepoImp(this._signUpRemoteDataSourceImp);

  @override
  Future<BaseResponse<SignUpResponseEntity>> signUp({
    required SignUpDataRequestEntity signUpDataRequest,
  }) async {
    final response = await _signUpRemoteDataSourceImp.signUp(
      signUpDataRequest: SignUpDataRequest.fromDomain(signUpDataRequest),
    );

    switch (response) {
      case SuccessBaseResponse<SignupResponse> successResponse:
        return SuccessBaseResponse<SignUpResponseEntity>(
          data: successResponse.data.toDomain(),
        );

      case ErrorBaseResponse<SignupResponse> errorResponse:
        return ErrorBaseResponse<SignUpResponseEntity>(
          errorMessage: errorResponse.errorMessage,
        );
    }
  }
}
