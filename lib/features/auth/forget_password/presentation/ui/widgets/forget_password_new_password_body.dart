import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopora/core/routes/app_routes.dart';
import 'package:shopora/core/shared_widgets/custom_elevated_button.dart';
import 'package:shopora/core/shared_widgets/custom_text_field_with_label.dart';
import 'package:shopora/core/utils/app_toaster/app_toaster.dart';
import 'package:shopora/core/utils/validation/app_validation.dart';
import 'package:shopora/features/auth/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:shopora/features/auth/forget_password/presentation/cubit/forget_password_state.dart';
import 'package:shopora/l10n/app_localizations.dart';

class ForgetPasswordNewPasswordBody extends StatefulWidget {
  const ForgetPasswordNewPasswordBody({super.key});

  @override
  State<ForgetPasswordNewPasswordBody> createState() =>
      _ForgetPasswordNewPasswordBodyState();
}

class _ForgetPasswordNewPasswordBodyState
    extends State<ForgetPasswordNewPasswordBody> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextFieldWithLabel(
              label: loc.authPassword,
              hintText: loc.authEnterPassword,
              prefixIcon: Icons.lock_outline,
              controller: _passwordController,
              validator: (value) =>
                  AppValidators.validatePassword(context, value),
              obscureText: _obscurePassword,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: theme.colorScheme.secondary,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),

            const SizedBox(height: 16),

            CustomTextFieldWithLabel(
              label: loc.authConfirmPassword,
              hintText: loc.authEnterPassword,
              prefixIcon: Icons.lock_outline,
              controller: _confirmPasswordController,
              validator: (value) => AppValidators.confirmPassword(
                context,
                _passwordController.text,
                value,
              ),
              obscureText: _obscureConfirmPassword,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureConfirmPassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: theme.colorScheme.secondary,
                ),
                onPressed: () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
              ),
            ),

            const SizedBox(height: 24),

            BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
              listenWhen: (previous, current) =>
                  previous.resetPasswordState != current.resetPasswordState,
              listener: (context, state) {
                final errorMessage = state.resetPasswordState.errorMessage;

                if (errorMessage != null) {
                  AppToastr.error(errorMessage);
                  return;
                }

                if (state.resetPasswordState.data != null) {
                  AppToastr.success(loc.authResetPasswordSuccess);

                  Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoutes.signInScreen,
                    (route) => false,
                  );
                }
              },
              builder: (context, state) {
                final isLoading = state.resetPasswordState.isLoading;

                return CustomElevatedButton(
                  text: loc.authContinue,
                  isLoading: isLoading,
                  onPressed: isLoading
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            context.read<ForgetPasswordCubit>().resetPassword(
                              _passwordController.text,
                            );
                          }
                        },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
