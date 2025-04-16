import 'package:flutter/material.dart';
import 'package:horsly_bit/core/theme/app_colors.dart';
import 'package:horsly_bit/core/theme/text_style.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled(
      {super.key,
      this.controller,
      this.prefixIcon,
      this.prefix,
      this.suffixIcon,
      this.errorText,
      required this.hintText,
      required this.borderColor,
      this.maxLines,
      this.minLines,
      this.height,
      this.focusNode,
      this.keyboardType,
      this.onFieldSubmitted,
      this.enabled,
      this.validator,
      this.textInputAction,
      this.maxLength,
      required this.topPadding,
      required this.bottomPadding,
      this.fillColor = AppColors.lightGrayAppColor,
      this.filled = true,
      this.readOnly,
      this.borderRadius,
      this.onChanged});
  final TextEditingController? controller;
  final Widget? prefixIcon, prefix;
  final Widget? suffixIcon;
  final String? errorText;
  final String hintText;
  final Color borderColor;
  final int? maxLines;
  final int? minLines;
  final double? height;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final bool? enabled;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final double topPadding;
  final double bottomPadding;
  final Color? fillColor;
  final bool? filled;
  final bool? readOnly;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly ?? false,
      textInputAction: textInputAction,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      enabled: enabled,
      keyboardType: keyboardType,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      focusNode: focusNode,
      validator: validator,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: filled,
        hintText: hintText,
        prefixIcon: prefixIcon,
        prefix: prefix,
        suffixIcon: suffixIcon,
        hintStyle: AppTextStyle.style16w400Black(context)
            .copyWith(color: AppColors.secondaryGrayAppColor),
        errorText: errorText,
        contentPadding: EdgeInsetsDirectional.only(
            start: 20, top: topPadding, bottom: bottomPadding, end: 0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          borderSide: BorderSide(
            color: borderColor,
            width: 1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          borderSide: BorderSide(
            color: borderColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          borderSide: BorderSide(
            color: borderColor,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 4),
          borderSide: const BorderSide(
            color: AppColors.redColor,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 4),
          borderSide: const BorderSide(
            color: AppColors.redColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}
