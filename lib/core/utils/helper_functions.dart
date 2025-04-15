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
}
