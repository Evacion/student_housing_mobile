import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_housing_mobile/backend/backend.dart';
import 'package:student_housing_mobile/backend/user_info.dart';
import 'package:student_housing_mobile/widgets/universal_signout_button.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key}); // Remove 'const' here

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}


class _CustomDrawerState extends State<CustomDrawer> {
  final BackEnd _backEnd = BackEnd();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          FutureBuilder<User?>(
            future: _backEnd.getCurrentUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return UserInfoWidget(user: snapshot.data);
              }
            },
          ),
          SignOutButton(),
        ],
      ),
    );
  }
}