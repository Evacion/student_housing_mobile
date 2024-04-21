import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserInfoWidget extends StatelessWidget {
  final User? user;

  const UserInfoWidget({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final displayName = user?.displayName ?? 'Anonymous';
    final email = user?.email ?? 'No email';
    final photoUrl = user?.photoURL ?? '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: photoUrl.isNotEmpty ? NetworkImage(photoUrl) : null,
          backgroundColor: Colors.transparent,
          child: photoUrl.isEmpty ? const Icon(
            CupertinoIcons.person,
            size: 50,
            color: Colors.grey,
          ) : null,
        ),
        const SizedBox(height: 16),
        Text(
          displayName,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          email,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
