import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_housing_mobile/backend/backend.dart';
import 'package:student_housing_mobile/backend/user_info.dart';
import 'package:student_housing_mobile/widgets/universal_signout_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BackEnd _googleBackend = BackEnd(); // Initialize GoogleBackend

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("HOME PLACEHOLDER"),
            FutureBuilder<User?>(
              future: _googleBackend.getCurrentUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Return a loading indicator while waiting for the user data
                  return const CircularProgressIndicator();
                } else {
                  // Once the future completes, pass the user data to the UserInfoWidget
                  return UserInfoWidget(user: snapshot.data);
                }
              },
            ),
            SignOutButton(),
          ],
        ),
      ),
    );
  }
}
