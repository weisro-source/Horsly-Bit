import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class HelperFunctions {
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static void navigateToScreen(BuildContext context, WidgetBuilder screen) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => screen(context),
      ),
    );
  }

  static void navigateToScreenAndRemove(
      BuildContext context, WidgetBuilder screen) {
    Navigator.pushAndRemoveUntil(
      context,
      CupertinoPageRoute(
        builder: (_) => screen(context),
      ),
      (route) {
        return false;
      },
    );
  }

  static void navigateToBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  static bool isDebugMode() {
    return kDebugMode;
  }

  static void showCustomDialog(BuildContext context, Widget dialog) {
    showDialog(
      context: context,
      builder: (context) {
        return dialog;
      },
    );
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  // generate password Function
  static String generateSecurePassword() {
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
}
