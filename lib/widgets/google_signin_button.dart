import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:student_housing_mobile/backend/backend.dart';

class GoogleSigninButton extends StatefulWidget {
  const GoogleSigninButton({super.key});

  @override
  State<GoogleSigninButton> createState() => _GoogleSigninButtonState();
}

class _GoogleSigninButtonState extends State<GoogleSigninButton> {
  final BackEnd _googleSignInHelper = BackEnd();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
          onPressed: () async {
            // Google Sign-In authentication
            final user = await _googleSignInHelper.signInWithGoogle();
            if (user != null) {
              // User successfully signed in, handle further actions
              
              if (context.mounted) {
                // Push until reaching the modal route '/home'
                Navigator.of(context).pushNamed('/home');
              }
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
      child: const Text('Signin with Google'),
    );
  }
}