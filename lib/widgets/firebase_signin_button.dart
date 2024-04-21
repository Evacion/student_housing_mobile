import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:student_housing_mobile/backend/backend.dart';

class FirebaseSignInButton extends StatelessWidget {
  final BackEnd _firebaseBackend = BackEnd();

  FirebaseSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        // Firebase Sign-In authentication
        final user = await _firebaseBackend.signInAnonymously();
        if (user != null) {
          // User successfully signed in, handle further actions
          if (user.isAnonymous) {
            // Anonymous user signed in

            // Check if the widget is mounted
            if (context.mounted) {
              // Push until reaching the modal route '/home'
              Navigator.of(context).pushNamed('/home');
            }
            if (kDebugMode) {
              print('Anonymous user signed in: ${user.uid}');
            }
          }
        } else {
          // Handle sign-in failure
          if (kDebugMode) {
            print('Sign-in failed');
          }
        }
      },
      child: const Text('Signin as Guest with Firebase'),
    );
  }
}
