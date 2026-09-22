import 'package:shopora/config/base_response/base_response.dart';
import 'package:shopora/features/auth/sign_up/data/models/request/sign_up_data_request.dart';
import 'package:shopora/features/auth/sign_up/data/models/response/sign_up_response.dart';

abstract interface class SignUpRemoteDataSourceContract {
  Future<BaseResponse<SignupResponse>> signUp({
    required SignUpDataRequest signUpDataRequest,
  });
}
