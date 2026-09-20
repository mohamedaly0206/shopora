import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';

abstract class AppValidators {
  AppValidators._();

  static String? validateEmail(BuildContext context, String? email) {
    final loc = AppLocalizations.of(context)!;

    if (email == null || email.trim().isEmpty) {
      return loc.authEmailRequired;
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(email.trim())) {
      return loc.authEmailNotValid;
    }

    return null;
  }

  static String? validatePassword(BuildContext context, String? password) {
    final loc = AppLocalizations.of(context)!;

    if (password == null || password.isEmpty) {
      return loc.authPasswordRequired;
    }

    if (password.length < 8) {
      return loc.authPasswordLength;
    }

    final passwordRegex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$',
    );

    if (!passwordRegex.hasMatch(password)) {
      return loc.authPasswordInvalid;
    }

    return null;
  }

  static String? confirmPassword(
    BuildContext context,
    String? password,
    String? confirmPassword,
  ) {
    final loc = AppLocalizations.of(context)!;

    if (confirmPassword == null || confirmPassword.isEmpty) {
      return loc.authPasswordNotMatched;
    }

    if (password != confirmPassword) {
      return loc.authPasswordNotMatched;
    }

    return null;
  }

  static String? validateEmptyTextFormField(
    BuildContext context,
    String? value,
  ) {
    final loc = AppLocalizations.of(context)!;

    if (value == null || value.trim().isEmpty) {
      return loc.authFieldRequired;
    }

    return null;
  }

  static String? validateName(
    BuildContext context,
    String? value,
    String fieldName,
  ) {
    final loc = AppLocalizations.of(context)!;

    if (value == null || value.trim().isEmpty) {
      return '${loc.authFullNameRequired}';
    }

    final trimmedValue = value.trim();

    if (trimmedValue.length < 3) {
      return '${loc.authNameLength}';
    }

    return null;
  }

  static String? validatePhoneNumber(
    BuildContext context,
    String? phoneNumber,
  ) {
    final loc = AppLocalizations.of(context)!;

    if (phoneNumber == null || phoneNumber.trim().isEmpty) {
      return loc.authPhoneRequired;
    }

    final phoneRegex = RegExp(r'^\+20(10|11|12|15)[0-9]{8}$');

    if (!phoneRegex.hasMatch(phoneNumber.trim())) {
      return loc.authPhoneInvalid;
    }

    return null;
  }
}
