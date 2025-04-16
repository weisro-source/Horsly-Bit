import 'package:flutter/material.dart';
import 'package:horsly_bit/core/theme/text_style.dart';

class TitlesTextSection extends StatelessWidget {
  const TitlesTextSection({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyle.style32w500White(context),
    );
  }
}
