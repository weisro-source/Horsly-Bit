import 'package:flutter/material.dart';
import 'package:horsly_bit/core/assets_path/image_path.dart';
import 'package:horsly_bit/core/theme/text_style.dart';
import 'package:horsly_bit/core/utils/helper_functions.dart';
import 'package:horsly_bit/core/utils/sized_box_extension.dart';
import 'package:horsly_bit/feature/splash_and_onboarding/data/welcome_sentences_model.dart';

class WelcomeScreenPageViewBody extends StatelessWidget {
  const WelcomeScreenPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImagePath.imagesBackground),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  welcomeSentencesList[0].title,
                  style: AppTextStyle.style32w500White(context),
                ),
                20.kh,
                SizedBox(
                  width: HelperFunctions.getScreenWidth(context) * 0.66,
                  child: Text(
                    welcomeSentencesList[0].body,
                    style: AppTextStyle.style16w400White(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
