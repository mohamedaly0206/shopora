import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopora/core/theme/app_colors.dart';
import 'package:shopora/core/theme/app_text_styles.dart';
import 'package:shopora/core/utils/app_validation.dart';
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
  bool _obscurePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
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
          rePassword: _passwordController.text,
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

                    // Full Name
                    Text(
                      loc.authFullName,
                      style: AppTextStyles.textStyleMedium13.copyWith(
                        color: AppColors.blackColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _nameController,
                      validator: (value) => AppValidators.validateName(
                        context,
                        value,
                        loc.authFullName,
                      ),
                      decoration: InputDecoration(
                        hintText: loc.authEnterFullName,
                        prefixIcon: const Icon(
                          Icons.person_outline,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Email
                    Text(
                      loc.authEmail,
                      style: AppTextStyles.textStyleMedium13.copyWith(
                        color: AppColors.blackColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _emailController,
                      validator: (value) =>
                          AppValidators.validateEmail(context, value),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: loc.authEnterYourEmail,
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Phone Number
                    Text(
                      loc.authPhone,
                      style: AppTextStyles.textStyleMedium13.copyWith(
                        color: AppColors.blackColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _phoneController,
                      validator: (value) =>
                          AppValidators.validatePhoneNumber(context, value),
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: loc.authEnterPhoneNumber,
                        prefixIcon: const Icon(
                          Icons.phone_outlined,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Password
                    Text(
                      loc.authPassword,
                      style: AppTextStyles.textStyleMedium13.copyWith(
                        color: AppColors.blackColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _passwordController,
                      validator: (value) =>
                          AppValidators.validatePassword(context, value),
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        hintText: loc.authEnterYourPassword,
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: AppColors.secondaryColor,
                        ),
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
                    ),
                    const SizedBox(height: 16),

                    // Checkbox
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
                    const SizedBox(height: 18),

                    // Sign Up Button
                    ElevatedButton(
                      onPressed: state.signUpState.isLoading
                          ? null
                          : _onSignUpPressed,
                      child: state.signUpState.isLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: AppColors.whiteColor,
                                strokeWidth: 2,
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(loc.authCreateYourAccount),
                                const SizedBox(width: 8),
                                const Icon(Icons.arrow_forward),
                              ],
                            ),
                    ),
                    const SizedBox(height: 16),

                    // Already have an account
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
                          child: Text(loc.authLogin),
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
