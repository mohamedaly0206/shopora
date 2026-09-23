import 'package:flutter/material.dart';
import 'package:shopora/core/theme/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  final String text;
  final bool hideArrowIcon;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
    required this.text,
    this.hideArrowIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      child: isLoading
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
                Text(text),
                const SizedBox(width: 8),
                if (!hideArrowIcon) const Icon(Icons.arrow_forward),
              ],
            ),
    );
  }
}
