import 'dart:math';

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
                    allowImplicitScrolling: false,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            32.kh,
                            if (_currentPage == 0) const EmailFormWidget(),
                            if (_currentPage == 1) const PasswordFormWidget(),
                            const Spacer(),
                            MainAppButton(
                              onPressed: _nextPage,
                              text: S.of(context).continueButton,
                              buttonColor: AppColors.lightGrayAppColor,
                              textColor: AppColors.secondaryGrayAppColor,
                            ),
                            12.kh,
                            if (_currentPage == 0)
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

class EmailFormWidget extends StatelessWidget {
  const EmailFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleSectionInAuthPage(
          title: S.of(context).password,
        ),
        12.kh,
        BodySectionAuthPage(
          body: S.of(context).createStrongPassword,
        ),
        24.kh,
        CustomTextFormFiled(
          hintText: S.of(context).enterPassword,
          borderColor: AppColors.lightGrayAppColor,
          topPadding: 0,
          bottomPadding: 0,
        ),
      ],
    );
  }
}

class PasswordFormWidget extends StatefulWidget {
  const PasswordFormWidget({super.key});

  @override
  State<PasswordFormWidget> createState() => _PasswordFormWidgetState();
}

class _PasswordFormWidgetState extends State<PasswordFormWidget> {
  final TextEditingController _passwordController = TextEditingController();

  bool hasMinLength = false;
  bool hasLetter = false;
  bool hasNumber = false;
  bool hasSpecialChar = false;

  void _validatePassword(String password) {
    setState(() {
      hasMinLength = password.length >= 15;
      hasLetter = RegExp(r'[A-Za-z]').hasMatch(password);
      hasNumber = RegExp(r'[0-9]').hasMatch(password);
      hasSpecialChar = RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(password);
    });
  }

  String _generateSecurePassword() {
    const letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const numbers = '0123456789';
    const special = '!@#\$%^&*(),.?":{}|<>';
    const all = letters + numbers + special;

    final rand = Random.secure();
    String getRand(String chars) => chars[rand.nextInt(chars.length)];

    // Ensure all types included
    String password = getRand(letters) + getRand(numbers) + getRand(special);

    // Fill the rest randomly
    while (password.length < 15) {
      password += getRand(all);
    }

    // Shuffle the password
    List<String> chars = password.split('');
    chars.shuffle(rand);
    return chars.join();
  }

  void _onGeneratePassword() {
    final generatedPassword = _generateSecurePassword();
    _passwordController.text = generatedPassword;
    _validatePassword(generatedPassword);
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleSectionInAuthPage(title: S.of(context).password),
        12.kh,
        BodySectionAuthPage(body: S.of(context).createStrongPassword),
        24.kh,
        CustomTextFormFiled(
          controller: _passwordController,
          hintText: S.of(context).enterPassword,
          borderColor: AppColors.lightGrayAppColor,
          topPadding: 0,
          bottomPadding: 0,
          onChanged: _validatePassword,
        ),
        16.kh,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(S.of(context).passwordRequirements,
                style: AppTextStyle.style14w400secondaryGray(context)),
            TextButton(
              onPressed: _onGeneratePassword,
              child: Text(
                S.of(context).generatePassword,
                style: AppTextStyle.style15w600Black(context),
              ),
            )
          ],
        ),
        8.kh,
        _buildCheckItem(hasMinLength, S.of(context).min15Characters),
        _buildCheckItem(hasLetter, S.of(context).atLeastOneLetter),
        _buildCheckItem(hasNumber, S.of(context).atLeastOneNumber),
        _buildCheckItem(hasSpecialChar, S.of(context).atLeastOneSpecialChar),
        8.kh,
      ],
    );
  }

  Widget _buildCheckItem(bool isChecked, String label) {
    return Row(
      children: [
        Icon(
          isChecked ? Icons.check_circle : Icons.radio_button_unchecked,
          color: isChecked ? Colors.green : Colors.grey,
          size: 20,
        ),
        8.kw,
        Text(label, style: AppTextStyle.style14w400secondaryGray(context)),
      ],
    );
  }
}

class BodySectionAuthPage extends StatelessWidget {
  const BodySectionAuthPage({
    super.key,
    required this.body,
  });
  final String body;
  @override
  Widget build(BuildContext context) {
    return Text(
      body,
      style: AppTextStyle.style16w400Black(context),
    );
  }
}

class TitleSectionInAuthPage extends StatelessWidget {
  const TitleSectionInAuthPage({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyle.style20w600Black(context),
    );
  }
}
