import 'package:injectable/injectable.dart';
import 'package:shopora/config/base_response/base_response.dart';
import 'package:shopora/features/auth/forget_password/domain/entities/request/verify_reset_code_request_entity.dart';
import 'package:shopora/features/auth/forget_password/domain/entities/response/verify_reset_code_response_entity.dart';
import 'package:shopora/features/auth/forget_password/domain/repo/forget_password_repo_contract.dart';

@injectable
class VerifyResetCodeUseCase {
  final ForgetPasswordRepoContract _forgetPasswordRepoContract;

  VerifyResetCodeUseCase(this._forgetPasswordRepoContract);

  Future<BaseResponse<VerifyResetCodeResponseEntity>> call({
    required VerifyResetCodeRequestEntity verifyResetCodeRequestEntity,
  }) async {
    return await _forgetPasswordRepoContract.verifyResetCode(
      verifyResetCodeRequestEntity: verifyResetCodeRequestEntity,
    );
  }
}
