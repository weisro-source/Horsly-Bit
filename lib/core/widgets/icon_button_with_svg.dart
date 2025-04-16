import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconButtonWithSvg extends StatelessWidget {
  final String iconSvg;
  final VoidCallback onPressed;

  IconButtonWithSvg({
    super.key,
    required this.iconSvg,
    required this.onPressed,
  }) {
    assert(
      iconSvg.toLowerCase().contains('.svg'),
      'The iconSvg must be an SVG file (contain ".svg")',
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsetsDirectional.all(0),
      onPressed: onPressed,
      icon: SvgPicture.asset(iconSvg),
    );
  }
}
