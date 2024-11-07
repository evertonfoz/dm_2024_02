import 'package:aula_02_onboarding/features/login/forgot_password.dart';
import 'package:aula_02_onboarding/features/register/presentation/register.dart';
import 'package:aula_02_onboarding/features/login/reset_password.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/login/presentation/login_page.dart';
import 'features/login/verify_code.dart';
import 'features/on_boarding/presentation/onboarding_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

  await dotenv.load(fileName: "supabase.env");

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] ?? '',
    anonKey: dotenv.env['SUPABASE_ANNON_KEY'] ?? '',
  );

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
      routes: {
        '/forgot_password': (context) => const ForgotPasswordScreen(),
        '/verify_code': (context) => const VerifyCodeScreen(),
        '/reset_password': (context) => const ResetPasswordScreen(),
        '/register': (context) => const RegisterScreen(),
      },
    );
  }
}
