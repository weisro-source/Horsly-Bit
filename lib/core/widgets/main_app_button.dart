import 'package:flutter/material.dart';
import 'package:horsly_bit/core/theme/app_colors.dart';
import 'package:horsly_bit/core/theme/text_style.dart';

class MainAppButton extends StatelessWidget {
  const MainAppButton(
      {super.key,
      this.buttonColor,
      this.borderColor,
      this.child,
      this.text,
      this.onPressed,
      this.height,
      this.width,
      this.textStyle,
      this.focusNode,
      this.textColor,
      this.borderRadius});

  final Color? buttonColor;
  final Color? borderColor;
  final Color? textColor;
  final Widget? child;
  final String? text;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  final double? borderRadius;
  final TextStyle? textStyle;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      focusNode: focusNode,
      style: ElevatedButton.styleFrom(
        maximumSize: Size.fromHeight(height ?? 45),
        backgroundColor: buttonColor ?? AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: borderColor ?? buttonColor ?? AppColors.whiteColor),
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
        ),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: child ??
          Center(
            child: Text(
              text ?? "Continue",
              style: textStyle ??
                  AppTextStyle.style16w500Black(context)
                      .copyWith(color: textColor),
            ),
          ),
    );
  }
}
