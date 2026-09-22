import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopora/core/routes/app_routes.dart';
import 'package:shopora/core/theme/app_text_styles.dart';
import 'package:shopora/core/utils/app_toaster/app_toaster.dart';
import 'package:shopora/core/utils/validation/app_validation.dart';
import 'package:shopora/core/shared_widgets/custom_text_field_with_label.dart';
import 'package:shopora/core/shared_widgets/custom_elevated_button.dart';
import 'package:shopora/features/auth/sign_in/domain/entities/request/sign_in_data_request_entity.dart';
import 'package:shopora/features/auth/sign_in/presentation/cubit/sign_in_cubit.dart';
import 'package:shopora/features/auth/sign_in/presentation/cubit/sign_in_state.dart';
import 'package:shopora/l10n/app_localizations.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSignInPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<SignInCubit>().signIn(
        signInDataRequest: SignInDataRequestEntity(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      body: BlocConsumer<SignInCubit, SignInState>(
        listenWhen: (previous, current) =>
            previous.signInState != current.signInState,
        listener: (context, state) {
          if (state.signInState.data != null) {
            AppToastr.success(loc.authLoginSuccessfully);
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.homeScreen,
              (route) => false,
            );
          } else if (state.signInState.errorMessage != null) {
            AppToastr.error(state.signInState.errorMessage!);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 32),
                    Text(
                      loc.authWelcomeBack,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.textStyleSemiBold20.copyWith(
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      loc.authSignInToYourAccount,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.textStyleRegular14.copyWith(
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                    const SizedBox(height: 32),

                    CustomTextFieldWithLabel(
                      label: loc.authEmail,
                      hintText: loc.authEnterYourEmail,
                      prefixIcon: Icons.email_outlined,
                      controller: _emailController,
                      validator: (value) =>
                          AppValidators.validateEmail(context, value),
                      keyboardType: TextInputType.emailAddress,
                    ),

                    const SizedBox(height: 24),

                    CustomTextFieldWithLabel(
                      label: loc.authPassword,
                      hintText: loc.authEnterYourPassword,
                      prefixIcon: Icons.lock_outline,
                      controller: _passwordController,
                      validator: (value) =>
                          AppValidators.validateEmptyTextFormField(
                            context,
                            value,
                            loc.authPassword,
                          ),
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
                    Row(
                      children: [
                        Checkbox(
                          value: state.rememberMe,
                          onChanged: (value) {
                            if (value != null) {
                              context.read<SignInCubit>().toggleRememberMe(
                                value,
                              );
                            }
                          },
                          activeColor: theme.colorScheme.primary,
                        ),
                        Text(
                          loc.authRememberMe,
                          style: theme.textTheme.bodySmall,
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            // Navigator.pushNamed(context, AppRoutes.forgetPasswordScreen);
                          },
                          child: Text(
                            loc.authForgetPassword,
                            style: theme.textTheme.titleSmall?.copyWith(
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),

                    CustomElevatedButton(
                      isLoading: state.signInState.isLoading,
                      onPressed: _onSignInPressed,
                      text: loc.authSignIn,
                    ),

                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          loc.authDoNotHaveAnAccount,
                          style: AppTextStyles.textStyleRegular14.copyWith(
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.signUpScreen,
                            );
                          },
                          child: Text(loc.authSignUp),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
