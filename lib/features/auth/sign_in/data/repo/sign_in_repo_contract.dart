import 'package:shopora/config/base_response/base_response.dart';
import 'package:shopora/features/auth/sign_in/data/models/request/sign_in_data_request.dart';
import 'package:shopora/features/auth/sign_in/data/models/response/sign_in_response.dart';

abstract interface class SignInRepoContract {
  Future<BaseResponse<SignInResponse>> signIn({
    required SignInDataRequest signInDataRequest,
  });
}
