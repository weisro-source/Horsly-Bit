import 'package:flutter/material.dart';
import 'package:horsly_bit/core/theme/app_colors.dart';
import 'package:horsly_bit/core/utils/helper_functions.dart';
import 'package:horsly_bit/feature/splash_and_onboarding/presentation/view/pages/welcome_screen_page_view.dart';
import '../../../../../core/widgets/logo_icon_with_theme_mode.dart';

class SplashPageView extends StatefulWidget {
  const SplashPageView({super.key});

  @override
  State<SplashPageView> createState() => _SplashPageViewState();
}

class _SplashPageViewState extends State<SplashPageView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        if (!mounted) return;
        HelperFunctions.navigateToScreenAndRemove(
          context,
          (context) => const WelcomeScreenPageView(),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor: dark ? Colors.black : AppColors.whiteColor,
      body: Center(
        child: LogoIconWithThemeMode(dark: dark),
      ),
    );
  }
}
