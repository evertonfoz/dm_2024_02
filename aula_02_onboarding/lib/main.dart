import 'package:aula_02_onboarding/features/login/forgot_password.dart';
import 'package:aula_02_onboarding/features/login/presentation/Register.dart';
import 'package:aula_02_onboarding/features/login/reset_password.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/login/presentation/login_page.dart';
import 'features/login/verify_code.dart';
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
      routes: {
        '/forgot_password': (context) => const ForgotPasswordScreen(),
        '/verify_code': (context) => const VerifyCodeScreen(),
        '/reset_password': (context) => const ResetPasswordScreen(),
        '/register': (context) => const RegisterScreen(),
      },
    );
  }
}

/*class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
     return MaterialApp( 
      title: 'Forgot Password',
       theme: ThemeData( 
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primarySwatch: Colors.blue,
        ),
        home: const ForgotPasswordScreen()
     );
   }
}
*/
