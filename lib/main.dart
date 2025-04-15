import 'package:flutter/material.dart';
import 'package:horsly_bit/feature/splash_and_onboarding/presentation/view/pages/splash_page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horsily Bit',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SplashPageView(),
    );
  }
}
