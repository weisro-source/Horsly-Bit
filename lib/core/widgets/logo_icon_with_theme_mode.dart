import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:horsly_bit/core/assets_path/icons_path.dart';
import 'package:horsly_bit/core/theme/app_colors.dart';

class LogoIconWithThemeMode extends StatelessWidget {
  const LogoIconWithThemeMode({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      IconsPath.iconsLogo,
      colorFilter: ColorFilter.mode(
        dark ? Colors.white : AppColors.blackAppColor,
        BlendMode.srcIn,
      ),
    );
  }
}
