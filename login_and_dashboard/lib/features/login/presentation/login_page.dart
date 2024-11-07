import 'package:flutter/material.dart';
import 'package:login_and_dashboard/shared/functions/security/password_crypto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  String _userEMail = '';
  String _userPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _userEMail = value;
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              onChanged: (value) {
                _userPassword = value;
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                final data = await Supabase.instance.client
                    .from('users')
                    .select('user_email')
                    .eq('user_email', _userEMail)
                    .eq('password', generateHash(_userPassword))
                    .maybeSingle();

                if (data != null) {
                  Navigator.pushNamed(context, '/dashboard');
                }
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
