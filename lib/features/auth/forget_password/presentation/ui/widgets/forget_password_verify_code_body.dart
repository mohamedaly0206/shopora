import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopora/core/utils/app_toaster/app_toaster.dart';
import 'package:shopora/features/auth/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:shopora/features/auth/forget_password/presentation/cubit/forget_password_state.dart';
import 'package:shopora/features/auth/forget_password/presentation/ui/widgets/custom_otp_text_field.dart';
import 'package:shopora/l10n/app_localizations.dart';

class ForgetPasswordVerifyCodeBody extends StatelessWidget {
  const ForgetPasswordVerifyCodeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final loc = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
            buildWhen: (previous, current) => previous.email != current.email,
            builder: (context, state) {
              return Text(
                '${loc.authVerificationSubtitle} '
                '${state.email}. '
                '${loc.authVerificationHint}',
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              );
            },
          ),

          const SizedBox(height: 24),

          BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listenWhen: (previous, current) =>
                previous.verifyResetCodeState != current.verifyResetCodeState,
            listener: (context, state) {
              final errorMessage = state.verifyResetCodeState.errorMessage;

              if (errorMessage != null) {
                AppToastr.error(errorMessage);
              }
            },
            builder: (context, state) {
              return CustomOTPTextField(
                state: state,
                onSubmit: (code) {
                  if (!state.verifyResetCodeState.isLoading) {
                    context.read<ForgetPasswordCubit>().verifyResetCode(code);
                  }
                },
              );
            },
          ),

          const SizedBox(height: 16),

          BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
            buildWhen: (previous, current) =>
                previous.forgetPasswordState.isLoading !=
                current.forgetPasswordState.isLoading,
            builder: (context, state) {
              final isLoading = state.forgetPasswordState.isLoading;

              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    loc.authDidNotReceiveCode,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(width: 4),
                  TextButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            final cubit = context.read<ForgetPasswordCubit>();

                            cubit.clearVerifyResetCodeState();
                            cubit.forgetPassword();
                          },
                    child: isLoading
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(loc.authResendCode),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
