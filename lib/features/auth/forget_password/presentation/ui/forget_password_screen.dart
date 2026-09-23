import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopora/features/auth/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:shopora/features/auth/forget_password/presentation/cubit/forget_password_state.dart';
import 'package:shopora/features/auth/forget_password/presentation/ui/widgets/forget_password_email_body.dart';
import 'package:shopora/features/auth/forget_password/presentation/ui/widgets/forget_password_new_password_body.dart';
import 'package:shopora/features/auth/forget_password/presentation/ui/widgets/forget_password_verify_code_body.dart';
import 'package:shopora/l10n/app_localizations.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listenWhen: (previous, current) =>
          previous.currentPage != current.currentPage,
      listener: (context, state) {
        _pageController.animateToPage(
          state.currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
        buildWhen: (previous, current) =>
            previous.currentPage != current.currentPage,
        builder: (context, state) {
          final loc = AppLocalizations.of(context)!;

          String title = loc.authForgetPasswordTitle;

          if (state.currentPage == 1) {
            title = loc.authVerification;
          } else if (state.currentPage == 2) {
            title = loc.authCreateNewPassword;
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(title),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  if (state.currentPage > 0) {
                    context.read<ForgetPasswordCubit>().updateCurrentPage(
                      state.currentPage - 1,
                    );
                  } else {
                    Navigator.pop(context);
                  }
                },
              ),
            ),
            body: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                ForgetPasswordEmailBody(),
                ForgetPasswordVerifyCodeBody(),
                ForgetPasswordNewPasswordBody(),
              ],
            ),
          );
        },
      ),
    );
  }
}
