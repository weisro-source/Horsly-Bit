import 'package:flutter/material.dart';
import 'package:horsly_bit/feature/splash_and_onboarding/presentation/view/pages/splash_page_view.dart';
import 'package:horsly_bit/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('en'),
      title: 'Horsily Bit',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SplashPageView(),
    );
  }
}
