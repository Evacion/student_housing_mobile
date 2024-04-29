import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:student_housing_mobile/backend/backend.dart';

class FirebaseSignInButton extends StatefulWidget {
  const FirebaseSignInButton({super.key});

  @override
  State createState() => _FirebaseSignInButtonState();
}

class _FirebaseSignInButtonState extends State<FirebaseSignInButton> {
  final BackEnd _firebaseBackend = BackEnd();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 50,
      child: OutlinedButton(
        onPressed: () async {
          final user = await _firebaseBackend.signInAnonymously();
          if (user != null) {
            if (context.mounted) {
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
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person),
            SizedBox(width: 10),
            Text('Anonymous Sign In'),
          ],
        ),
      ),
    );
  }
}
