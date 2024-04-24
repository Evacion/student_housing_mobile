import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            final user = await _googleSignInHelper.signInWithGoogle();
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
        children: [
          FaIcon(FontAwesomeIcons.google, size: 20),
          SizedBox(width: 10,),
          Text('Sign In with Google'),
        ],
      ),
    );
  }
}