import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/login/presentation/login_page.dart';
import 'features/on_boarding/presentation/onboarding_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

  asyncPrefs.getBool('show_on_boarding').then((value) {
    runApp(OnBoardingApp(
      showOnBoardingPage: value ?? true,
    ));
  });
}

class OnBoardingApp extends StatelessWidget {
  final bool showOnBoardingPage;

  const OnBoardingApp({
    super.key,
    required this.showOnBoardingPage,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aula sobre OnBoarding',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: showOnBoardingPage ? const OnBoardingPage() : const LoginPage(),
    );
  }
}
