import 'package:flutter/material.dart';
import 'package:student_housing_mobile/backend/backend.dart';

class SignOutButton extends StatelessWidget {
  final BackEnd _backend = BackEnd();

  SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await _backend.signOut();
        if (context.mounted) {
          Navigator.of(context).popUntil((route) => route.isFirst);
        }
      },
      child: const Text('Sign Out'),
    );
  }
}
