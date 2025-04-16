import 'package:flutter/material.dart';
import 'package:horsly_bit/core/assets_path/icons_path.dart';
import 'package:horsly_bit/core/theme/app_colors.dart';
import 'package:horsly_bit/core/theme/text_style.dart';
import 'package:horsly_bit/core/utils/helper_functions.dart';
import 'package:horsly_bit/core/utils/sized_box_extension.dart';
import 'package:horsly_bit/core/widgets/custom_text_form_filed.dart';
import 'package:horsly_bit/core/widgets/main_app_button.dart';
import 'package:horsly_bit/feature/splash_and_onboarding/presentation/view/widgets/back_ground_image.dart';
import 'package:horsly_bit/generated/l10n.dart';
import '../../../../../../core/widgets/icon_button_with_svg.dart';

class RegisterPageViewBody extends StatefulWidget {
  const RegisterPageViewBody({super.key});

  @override
  State<RegisterPageViewBody> createState() => _RegisterPageViewBodyState();
}

class _RegisterPageViewBodyState extends State<RegisterPageViewBody> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: [
          const BackGroundImage(),
          Container(
            margin: const EdgeInsetsDirectional.only(top: 16),
            width: HelperFunctions.getScreenWidth(context),
            height: HelperFunctions.getScreenHight(context),
            decoration: const BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(20),
                topEnd: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                26.kh,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    32.kw,
                    // Progress Bar
                    SizedBox(
                      height: 4,
                      width: 100,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, dotIndex) {
                          return Container(
                            height: 3,
                            width: 28,
                            decoration: BoxDecoration(
                              color: dotIndex <= _currentPage
                                  ? AppColors.blackAppColor
                                  : null,
                              border: Border.all(
                                color: AppColors.greyAppColor,
                                width: 1,
                              ),
                              borderRadius: const BorderRadiusDirectional.all(
                                Radius.circular(4),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (_, __) => 8.kw,
                        itemCount: 3,
                      ),
                    ),
                    IconButtonWithSvg(
                      iconSvg: IconsPath.iconsCloseIcon,
                      onPressed: () {
                        // Handle close
                      },
                    ),
                  ],
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (value) {
                      setState(() {
                        _currentPage = value;
                      });
                    },
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            32.kh,
                            Text(
                              S.of(context).createAccount,
                              style: AppTextStyle.style20w600Black(context),
                            ),
                            12.kh,
                            Text(
                              S.of(context).enterEmailAddress,
                              style: AppTextStyle.style16w400Black(context),
                            ),
                            24.kh,
                            CustomTextFormFiled(
                              hintText: S.of(context).yourEmail,
                              borderColor: AppColors.lightGrayAppColor,
                              topPadding: 0,
                              bottomPadding: 0,
                            ),
                            const Spacer(),
                            MainAppButton(
                              onPressed: _nextPage,
                              text: S.of(context).continueButton,
                              buttonColor: AppColors.lightGrayAppColor,
                              textColor: AppColors.whiteColor,
                            ),
                            12.kh,
                            MainAppButton(
                              onPressed: () {
                                // Skip or alternative action
                              },
                              text: S.of(context).alreadyHaveAccount,
                              buttonColor: AppColors.lightGrayAppColor,
                              textColor: AppColors.blackAppColor,
                            ),
                            28.kh,
                          ],
                        ),
                      );
                    },
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
