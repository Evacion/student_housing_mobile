// ignore_for_file: unused_field

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:student_housing_mobile/backend/firebase_backend.dart';
import 'package:student_housing_mobile/backend/google_auth.dart';
import 'package:student_housing_mobile/widgets/firebase_signin_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignInHelper _googleSignInHelper = GoogleSignInHelper();
  final FirebaseBackend _firebaseBackend = FirebaseBackend();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Center(
        child: FirebaseSignInButton(
          onPressed: () async {
            // Google Sign-In authentication
            final user = await _googleSignInHelper.signInWithGoogle();
            if (user != null) {
              // User successfully signed in, handle further actions
              if (kDebugMode) {
                print('User signed in: ${user.displayName}');
              }
            } else {
              // Handle sign-in failure
              if (kDebugMode) {
                print('Sign-in failed');
              }
            }
          },
        ),
      ),
    );
  }
}