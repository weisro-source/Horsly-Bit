import 'package:flutter/material.dart';
import 'package:horsly_bit/core/utils/helper_functions.dart';

import 'package:horsly_bit/core/utils/sized_box_extension.dart';
import 'package:horsly_bit/feature/splash_and_onboarding/data/welcome_sentences_model.dart';
import 'package:horsly_bit/feature/splash_and_onboarding/presentation/view/pages/intro_screen_page_view.dart';

import '../../../../../core/widgets/main_app_button.dart';
import '../widgets/back_ground_image.dart';
import '../widgets/body_text_section.dart';
import '../widgets/titles_section.dart';

class WelcomeScreenPageViewBody extends StatelessWidget {
  const WelcomeScreenPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BackGroundImage(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TitlesTextSection(
                      title: welcomeSentencesList[0].title,
                    ),
                    20.kh,
                    BodyTextSection(
                      body: welcomeSentencesList[0].body,
                    ),
                  ],
                ),
                const Spacer(),
                MainAppButton(
                  onPressed: () {
                    HelperFunctions.navigateToScreenAndRemove(
                      context,
                      (context) => const IntroScreenPageView(),
                    );
                  },
                ),
                20.kh,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
