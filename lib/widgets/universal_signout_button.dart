import 'package:flutter/material.dart';
import 'package:student_housing_mobile/backend/backend.dart';

class SignOutButton extends StatelessWidget {
  final BackEnd _firebaseBackend = BackEnd();
  final BackEnd _googleBackend = BackEnd();

  SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        // Sign out from Google
        await _googleBackend.signOut();
        // Sign out from Firebase
        await _firebaseBackend.signOut();

        // Check if the widget is mounted
        if (context.mounted) {
          // Pop until reaching the modal route '/'
          Navigator.of(context).popUntil((route) => route.isFirst);
        }
      },
      child: const Text('Sign Out'),
    );
  }
}
