import 'package:flutter/material.dart';
import 'package:student_housing_mobile/views/login.dart';
void main() {
  runApp(const MyApp());
}
// com.studenthousingdbproject.student_housing_mobile
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