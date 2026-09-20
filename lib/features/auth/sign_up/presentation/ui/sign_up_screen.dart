import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopora/core/theme/app_colors.dart';
import 'package:shopora/core/theme/app_text_styles.dart';
import 'package:shopora/core/utils/app_validation.dart';
import 'package:shopora/core/shared_widgets/custom_text_field_with_label.dart';
import 'package:shopora/core/shared_widgets/custom_elevated_button.dart';
import 'package:shopora/features/auth/sign_up/data/models/request/sign_up_data_request.dart';
import 'package:shopora/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:shopora/features/auth/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:shopora/l10n/app_localizations.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSignUpPressed() {
    final state = context.read<SignUpCubit>().state;
    if (!state.agreeTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${AppLocalizations.of(context)!.authCreatingAnAccountYouAgreeToOur} ${AppLocalizations.of(context)!.authTermsAndConditions}',
          ),
          backgroundColor: AppColors.errorColor,
        ),
      );
      return;
    }

    if (_formKey.currentState?.validate() ?? false) {
      context.read<SignUpCubit>().signUp(
        signUpDataRequest: SignUpDataRequest(
          name: _nameController.text.trim(),
          email: _emailController.text.trim(),
          password: _passwordController.text,
          rePassword: _confirmPasswordController.text,
          phone: _phoneController.text.trim(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocConsumer<SignUpCubit, SignUpState>(
        listenWhen: (previous, current) =>
            previous.signUpState != current.signUpState,
        listener: (context, state) {
          if (state.signUpState.data != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(loc.authSignUpSuccessMessage),
                backgroundColor: AppColors.successColor,
              ),
            );
            Navigator.pop(context); // Go back to Sign In
          } else if (state.signUpState.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.signUpState.errorMessage!),
                backgroundColor: AppColors.errorColor,
              ),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      loc.authCreateYourAccount,
                      style: AppTextStyles.textStyleSemiBold20.copyWith(
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      loc.authJoinShopora,
                      style: AppTextStyles.textStyleRegular14.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    const SizedBox(height: 32),

                    CustomTextFieldWithLabel(
                      label: loc.authFullName,
                      hintText: loc.authHintFirstNameText,
                      prefixIcon: Icons.person_outline,
                      controller: _nameController,
                      validator: (value) => AppValidators.validateName(
                        context,
                        value,
                        loc.authFullName,
                      ),
                    ),
                    const SizedBox(height: 16),

                    CustomTextFieldWithLabel(
                      label: loc.authEmail,
                      hintText: loc.authEnterYourEmail,
                      prefixIcon: Icons.email_outlined,
                      controller: _emailController,
                      validator: (value) =>
                          AppValidators.validateEmail(context, value),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),

                    CustomTextFieldWithLabel(
                      label: loc.authPhone,
                      hintText: loc.authEnterPhoneNumber,
                      prefixIcon: Icons.phone_outlined,
                      controller: _phoneController,
                      validator: (value) =>
                          AppValidators.validatePhoneNumber(context, value),
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 16),

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
                          color: AppColors.secondaryColor,
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
                          color: AppColors.secondaryColor,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 16),

                    Row(
                      children: [
                        Checkbox(
                          value: state.agreeTerms,
                          onChanged: (value) {
                            if (value != null) {
                              context.read<SignUpCubit>().toggleAgreeTerms(
                                value,
                              );
                            }
                          },
                          activeColor: AppColors.primaryColor,
                        ),
                        Expanded(
                          child: Wrap(
                            children: [
                              Text(
                                '${loc.authCreatingAnAccountYouAgreeToOur} ',
                                style: AppTextStyles.textStyleMedium12.copyWith(
                                  color: AppColors.blackColor,
                                ),
                              ),
                              Text(
                                loc.authTermsAndConditions,
                                style: AppTextStyles.textStyleSemiBold12
                                    .copyWith(
                                      color: AppColors.blackColor,
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),

                    CustomElevatedButton(
                      isLoading: state.signUpState.isLoading,
                      onPressed: _onSignUpPressed,
                      text: loc.authCreateYourAccount,
                    ),
                    const SizedBox(height: 48),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          loc.authAlreadyHaveAnAccount,
                          style: AppTextStyles.textStyleRegular14.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            loc.authLogin,
                            style: AppTextStyles.textStyleSemiBold12.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
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
