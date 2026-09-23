import 'package:injectable/injectable.dart';
import 'package:shopora/config/base_response/base_response.dart';
import 'package:shopora/features/auth/forget_password/domain/entities/request/reset_password_request_entity.dart';
import 'package:shopora/features/auth/forget_password/domain/entities/response/reset_password_response_entity.dart';
import 'package:shopora/features/auth/forget_password/domain/repo/forget_password_repo_contract.dart';

@injectable
class ResetPasswordUseCase {
  final ForgetPasswordRepoContract _forgetPasswordRepoContract;

  ResetPasswordUseCase(this._forgetPasswordRepoContract);

  Future<BaseResponse<ResetPasswordResponseEntity>> call({
    required ResetPasswordRequestEntity resetPasswordRequestEntity,
  }) async {
    return await _forgetPasswordRepoContract.resetPassword(
      resetPasswordRequestEntity: resetPasswordRequestEntity,
    );
  }
}
