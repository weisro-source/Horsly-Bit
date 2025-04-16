// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Create account`
  String get createAccount {
    return Intl.message(
      'Create account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Enter the email address you want to use.`
  String get enterEmailAddress {
    return Intl.message(
      'Enter the email address you want to use.',
      name: 'enterEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Your Email`
  String get yourEmail {
    return Intl.message('Your Email', name: 'yourEmail', desc: '', args: []);
  }

  /// `Continue`
  String get continueButton {
    return Intl.message('Continue', name: 'continueButton', desc: '', args: []);
  }

  /// `I already have an account`
  String get alreadyHaveAccount {
    return Intl.message(
      'I already have an account',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Create a strong password`
  String get createStrongPassword {
    return Intl.message(
      'Create a strong password',
      name: 'createStrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter password`
  String get enterPassword {
    return Intl.message(
      'Enter password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain:`
  String get passwordRequirements {
    return Intl.message(
      'Password must contain:',
      name: 'passwordRequirements',
      desc: '',
      args: [],
    );
  }

  /// `Generate password`
  String get generatePassword {
    return Intl.message(
      'Generate password',
      name: 'generatePassword',
      desc: '',
      args: [],
    );
  }

  /// `Minimum 15 characters`
  String get min15Characters {
    return Intl.message(
      'Minimum 15 characters',
      name: 'min15Characters',
      desc: '',
      args: [],
    );
  }

  /// `At least 1 letter`
  String get atLeastOneLetter {
    return Intl.message(
      'At least 1 letter',
      name: 'atLeastOneLetter',
      desc: '',
      args: [],
    );
  }

  /// `At least 1 number`
  String get atLeastOneNumber {
    return Intl.message(
      'At least 1 number',
      name: 'atLeastOneNumber',
      desc: '',
      args: [],
    );
  }

  /// `At least 1 special character`
  String get atLeastOneSpecialChar {
    return Intl.message(
      'At least 1 special character',
      name: 'atLeastOneSpecialChar',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
