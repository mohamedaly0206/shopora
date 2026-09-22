import 'package:shopora/config/base_response/base_response.dart';
import 'package:shopora/features/auth/sign_in/domain/entities/request/sign_in_data_request_entity.dart';
import 'package:shopora/features/auth/sign_in/domain/entities/response/sign_in_response_entity.dart';

abstract interface class SignInRepoContract {
  Future<BaseResponse<SignInResponseEntity>> signIn({
    required SignInDataRequestEntity signInDataRequest,
  });
}
