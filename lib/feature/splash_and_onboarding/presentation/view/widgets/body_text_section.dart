import 'package:flutter/material.dart';
import 'package:horsly_bit/core/theme/text_style.dart';
import 'package:horsly_bit/core/utils/helper_functions.dart';

class BodyTextSection extends StatelessWidget {
  const BodyTextSection({
    super.key,
    required this.body,
  });
  final String body;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: HelperFunctions.getScreenWidth(context) * 0.66,
      child: Text(
        body,
        style: AppTextStyle.style16w400White(context),
      ),
    );
  }
}
