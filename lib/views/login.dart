import 'package:flutter/material.dart';
import 'package:student_housing_mobile/widgets/firebase_signin_button.dart';
import 'package:student_housing_mobile/widgets/google_signin_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Center(
        child: Column(
          children: [
            FirebaseSignInButton(),
            const GoogleSigninButton(),
          ],
        ),
      ),
    );
  }
}