import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:student_housing_mobile/backend/backend.dart';

class FirebaseSignInButton extends StatelessWidget {
  final BackEnd _firebaseBackend = BackEnd();

  FirebaseSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final user = await _firebaseBackend.signInAnonymously();
        if (user != null) {
          if (user.isAnonymous) {
            if (context.mounted) {
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
      child: const Row(
        children: [
          Icon(Icons.person, size: 20),
          SizedBox(width: 10,),
          Text('Guest Sign In'),
        ],
      ),
    );
  }
}
