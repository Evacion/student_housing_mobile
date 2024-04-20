// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:student_housing_mobile/firebase_options.dart';
import 'package:student_housing_mobile/views/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
// com.studenthousingdbproject.student_housing_mobile
// 1//0esEWgw8BkHESCgYIARAAGA4SNwF-L9Irwe2e3cNjTyqAvBpg8qzvamA0gv477fpYQ7bE58c4qi7xUn6yTvn2uDbF18LUu4DIZEg
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
      // home: const MyHomePage(title: 'Gonzales, Ray James Amer L.'),
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const Placeholder(),
      }
    );
  }
}
//  7.070900300990318
///25.61570508962389