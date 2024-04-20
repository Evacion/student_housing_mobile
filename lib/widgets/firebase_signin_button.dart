import 'package:flutter/material.dart';

class FirebaseSignInButton extends StatelessWidget {
  final VoidCallback onPressed;

  const FirebaseSignInButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Sign in with Google'),
    );
  }
}
