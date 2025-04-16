import 'package:flutter/material.dart';
import 'package:horsly_bit/core/utils/helper_functions.dart';
import 'package:horsly_bit/core/utils/sized_box_extension.dart';
import 'package:horsly_bit/core/widgets/main_app_button.dart';
import 'package:horsly_bit/feature/auth/register/presentation/view/pages/register_page_view.dart';
import 'package:horsly_bit/feature/splash_and_onboarding/data/welcome_sentences_model.dart';
import 'package:horsly_bit/feature/splash_and_onboarding/presentation/view/widgets/back_ground_image.dart';
import 'package:horsly_bit/feature/splash_and_onboarding/presentation/view/widgets/body_text_section.dart';
import 'package:horsly_bit/feature/splash_and_onboarding/presentation/view/widgets/titles_section.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreenPageView extends StatefulWidget {
  const IntroScreenPageView({super.key});

  @override
  State<IntroScreenPageView> createState() => _IntroScreenPageViewState();
}

class _IntroScreenPageViewState extends State<IntroScreenPageView> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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
              children: [
                const Spacer(),
                Expanded(
                  flex: 3,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: _onPageChanged,
                    itemCount: welcomeSentencesList.length - 1,
                    itemBuilder: (context, index) {
                      final item = welcomeSentencesList[index + 1];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TitlesTextSection(title: item.title),
                          20.kh,
                          BodyTextSection(body: item.body),
                        ],
                      );
                    },
                  ),
                ),
                20.kh,
                SmoothPageIndicator(
                  controller: _pageController,
                  count: welcomeSentencesList.length - 1,
                  effect: const ExpandingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    spacing: 8,
                    dotColor: Colors.grey,
                    activeDotColor: Colors.white,
                  ),
                ),
                const Spacer(),
                MainAppButton(
                  onPressed: () {
                    if (_currentIndex < welcomeSentencesList.length - 2) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      HelperFunctions.navigateToScreenAndRemove(
                        context,
                        (context) => const RegisterPageView(),
                      );
                    }
                  },
                  text: _currentIndex == welcomeSentencesList.length - 2
                      ? "Get Started"
                      : "Continue",
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
