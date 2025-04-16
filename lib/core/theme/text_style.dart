import 'package:flutter/material.dart';
import 'package:horsly_bit/core/theme/app_colors.dart';
import 'package:horsly_bit/core/utils/constants.dart';

class AppTextStyle {
  AppTextStyle._();
  static String get _fontFamily => Constants.fontFamily;

  static TextStyle getCustomTextStyle(
      BuildContext context, TextStyle textStyle) {
    String fontFamily = _fontFamily;
    return textStyle.copyWith(fontFamily: fontFamily);
  }

  static TextStyle style14w400secondaryGray(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
        color: AppColors.secondaryGrayAppColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  static TextStyle style15w600Black(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
        color: AppColors.blackAppColor,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static TextStyle style16w400White(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
        color: AppColors.whiteColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  static TextStyle style16w500Black(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
        color: AppColors.blackAppColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static TextStyle style16w400Black(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
        color: AppColors.blackAppColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  static TextStyle style20w600Black(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
        color: AppColors.blackAppColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static TextStyle style32w500White(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
        color: AppColors.whiteColor,
        fontSize: 32,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
