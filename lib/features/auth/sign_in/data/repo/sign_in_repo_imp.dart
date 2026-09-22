import 'package:injectable/injectable.dart';
import 'package:shopora/config/base_response/base_response.dart';
import 'package:shopora/config/security_storage/security_storage.dart';
import 'package:shopora/core/values/app_strings.dart';
import 'package:shopora/features/auth/sign_in/data/data_source/sign_in_remote_data_source_contract.dart';
import 'package:shopora/features/auth/sign_in/data/models/request/sign_in_data_request_dto.dart';
import 'package:shopora/features/auth/sign_in/data/models/response/sign_in_response_dto.dart';
import 'package:shopora/features/auth/sign_in/domain/entities/request/sign_in_data_request_entity.dart';
import 'package:shopora/features/auth/sign_in/domain/entities/response/sign_in_response_entity.dart';
import 'package:shopora/features/auth/sign_in/domain/repo/sign_in_repo_contract.dart';

@Injectable(as: SignInRepoContract)
class SignInRepoImp implements SignInRepoContract {
  final SignInRemoteDataSourceContract _signInRemoteDataSourceImp;
  final SecurityStorage _securityStorage;

  SignInRepoImp(this._signInRemoteDataSourceImp, this._securityStorage);

  @override
  Future<BaseResponse<SignInResponseEntity>> signIn({
    required SignInDataRequestEntity signInDataRequest,
  }) async {
    final response = await _signInRemoteDataSourceImp.signIn(
      signInDataRequest: SignInDataRequestDto.fromDomain(signInDataRequest),
    );

    switch (response) {
      case SuccessBaseResponse<SignInResponseDto> successResponse:
        final token = response.data.token;
        if (token != null) {
          await _securityStorage.setSecuredString(AppStrings.token, token);
        }
        return SuccessBaseResponse<SignInResponseEntity>(
          data: successResponse.data.toDomain(),
        );

      case ErrorBaseResponse<SignInResponseDto> errorResponse:
        return ErrorBaseResponse<SignInResponseEntity>(
          errorMessage: errorResponse.errorMessage,
        );
    }
  }
}
