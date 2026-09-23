import 'package:injectable/injectable.dart';
import 'package:shopora/config/base_response/base_response.dart';
import 'package:shopora/features/auth/forget_password/domain/entities/request/forget_password_request_entity.dart';
import 'package:shopora/features/auth/forget_password/domain/entities/response/forget_password_response_entity.dart';
import 'package:shopora/features/auth/forget_password/domain/repo/forget_password_repo_contract.dart';

@injectable
class ForgetPasswordUseCase {
  final ForgetPasswordRepoContract _forgetPasswordRepoContract;

  ForgetPasswordUseCase(this._forgetPasswordRepoContract);

  Future<BaseResponse<ForgetPasswordResponseEntity>> call({
    required ForgetPasswordRequestEntity forgetPasswordRequestEntity,
  }) async {
    return await _forgetPasswordRepoContract.forgetPassword(
      forgetPasswordRequestEntity: forgetPasswordRequestEntity,
    );
  }
}
