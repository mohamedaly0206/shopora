import 'package:injectable/injectable.dart';
import 'package:shopora/config/base_response/base_response.dart';
import 'package:shopora/features/auth/sign_in/domain/entities/request/sign_in_data_request_entity.dart';
import 'package:shopora/features/auth/sign_in/domain/entities/response/sign_in_response_entity.dart';
import 'package:shopora/features/auth/sign_in/domain/repo/sign_in_repo_contract.dart';

@injectable
class SignInUseCase {
  final SignInRepoContract _signInRepoContract;
  SignInUseCase(this._signInRepoContract);
  Future<BaseResponse<SignInResponseEntity>> call({
    required SignInDataRequestEntity signInDataRequest,
  }) => _signInRepoContract.signIn(signInDataRequest: signInDataRequest);
}
