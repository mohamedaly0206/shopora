import 'package:flutter/material.dart';
import 'package:shopora/core/theme/app_colors.dart';
import 'package:toastr_flutter/toastr.dart';

abstract final class AppToastr {
  // ---------------------------------------------------------------------------
  // Configuration
  // ---------------------------------------------------------------------------

  static const Duration _duration = Duration(seconds: 4);

  static const Duration _showDuration = Duration(milliseconds: 250);

  static const Duration _hideDuration = Duration(milliseconds: 200);

  static const bool _showProgressBar = true;

  static const bool _showTypeIcons = true;

  static const bool _preventDuplicates = true;

  static const SwipeDismissDirection _swipeDirection =
      SwipeDismissDirection.vertical;

  // ---------------------------------------------------------------------------
  // Success
  // ---------------------------------------------------------------------------

  static void success(String message, {String? title}) {
    Toastr.custom(
      _config(
        type: ToastrType.success,
        message: message,
        title: title ?? 'Success',
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Error
  // ---------------------------------------------------------------------------

  static void error(String message, {String? title}) {
    Toastr.custom(
      _config(
        type: ToastrType.error,
        message: message,
        title: title ?? 'Something went wrong',
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Warning
  // ---------------------------------------------------------------------------

  static void warning(String message, {String? title}) {
    Toastr.custom(
      _config(
        type: ToastrType.warning,
        message: message,
        title: title ?? 'Warning',
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Info
  // ---------------------------------------------------------------------------

  static void info(String message, {String? title}) {
    Toastr.custom(
      _config(
        type: ToastrType.info,
        message: message,
        title: title ?? 'Information',
        backgroundColor: AppColors.primaryColor,
        iconColor: AppColors.primaryColor,
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Private configuration
  // ---------------------------------------------------------------------------

  static ToastrConfig _config({
    required ToastrType type,
    required String message,
    required String title,
    bool? showProgressBar,
    Duration? duration,
    Color? backgroundColor,
    Color? iconColor,
  }) {
    return ToastrConfig(
      type: type,
      title: title,
      message: message,
      backgroundColor: backgroundColor,
      iconTheme: ToastrIconTheme(
        primary: AppColors.whiteColor,
        secondary: iconColor,
      ),

      position: ToastrPosition.topCenter,

      showMethod: ToastrShowMethod.fadeIn,
      hideMethod: ToastrHideMethod.fadeOut,

      showDuration: _showDuration,
      hideDuration: _hideDuration,

      duration: duration ?? _duration,

      showProgressBar: showProgressBar ?? _showProgressBar,

      useTypeColors: true,
      showTypeIcons: _showTypeIcons,

      compact: false,

      preventDuplicates: _preventDuplicates,

      swipeDismissDirection: _swipeDirection,
    );
  }
}
