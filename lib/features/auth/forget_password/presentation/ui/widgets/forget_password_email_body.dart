import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopora/core/shared_widgets/custom_elevated_button.dart';
import 'package:shopora/core/shared_widgets/custom_text_field_with_label.dart';
import 'package:shopora/core/utils/app_toaster/app_toaster.dart';
import 'package:shopora/core/utils/validation/app_validation.dart';
import 'package:shopora/features/auth/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:shopora/features/auth/forget_password/presentation/cubit/forget_password_state.dart';
import 'package:shopora/l10n/app_localizations.dart';

class ForgetPasswordEmailBody extends StatefulWidget {
  const ForgetPasswordEmailBody({super.key});

  @override
  State<ForgetPasswordEmailBody> createState() =>
      _ForgetPasswordEmailBodyState();
}

class _ForgetPasswordEmailBodyState extends State<ForgetPasswordEmailBody> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              loc.authForgetPasswordSubtitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),

            CustomTextFieldWithLabel(
              controller: _emailController,
              hintText: loc.authEnterYourEmail,
              label: loc.authEmail,
              keyboardType: TextInputType.emailAddress,
              validator: (value) => AppValidators.validateEmail(context, value),
              prefixIcon: Icons.email_outlined,
            ),

            const SizedBox(height: 24),

            BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
              listenWhen: (previous, current) =>
                  previous.forgetPasswordState != current.forgetPasswordState,
              listener: (context, state) {
                final errorMessage = state.forgetPasswordState.errorMessage;

                if (errorMessage != null) {
                  AppToastr.error(errorMessage);
                }
              },
              builder: (context, state) {
                return CustomElevatedButton(
                  text: loc.authContinue,
                  isLoading: state.forgetPasswordState.isLoading,
                  onPressed: state.forgetPasswordState.isLoading
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            final cubit = context.read<ForgetPasswordCubit>();

                            cubit.updateEmail(_emailController.text.trim());

                            cubit.forgetPassword();
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
