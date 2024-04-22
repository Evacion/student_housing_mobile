import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:student_housing_mobile/views/home.dart';
import 'package:student_housing_mobile/views/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseAuth.instance.authStateChanges().first,
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          final bool isLoggedIn = snapshot.hasData;
          return MaterialApp(
            title: 'Student Housing Finder Mobile',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
            ),
            themeMode: ThemeMode.light,
            initialRoute: isLoggedIn ? '/home' : '/',
            routes: {
              '/': (context) => const LoginPage(),
              '/home': (context) => const HomePage(),
            },
          );
        }
      },
    );
  }
}
