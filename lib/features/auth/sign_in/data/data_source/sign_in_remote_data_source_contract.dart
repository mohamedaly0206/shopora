import 'package:shopora/config/base_response/base_response.dart';
import 'package:shopora/features/auth/sign_in/data/models/request/sign_in_data_request_dto.dart';
import 'package:shopora/features/auth/sign_in/data/models/response/sign_in_response_dto.dart';

abstract interface class SignInRemoteDataSourceContract {
  Future<BaseResponse<SignInResponseDto>> signIn({
    required SignInDataRequestDto signInDataRequest,
  });
}
