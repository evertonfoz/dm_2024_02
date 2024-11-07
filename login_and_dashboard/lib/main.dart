import 'package:flutter/material.dart';
import 'package:login_and_dashboard/features/dashboard/presentation/dashboard_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'features/login/presentation/login_page.dart';
import 'features/sign_up/presentation/signup_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: "assets/supabase.env");

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANNON_KEY']!,
  );

  runApp(const DMApp());
}

class DMApp extends StatelessWidget {
  const DMApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/dashboard': (context) => const DashboardPage()
      },
    );
  }
}
