import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:student_housing_mobile/views/home.dart'; 
import 'package:student_housing_mobile/views/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final initializationFuture = Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyB2ye5vscFm1eiOiPVBIQ8np-CnGNk4DQc",
      appId: "1:997141921548:web:70ec9011eff4595be8d329",
      messagingSenderId: "997141921548",
      projectId: "student-housing-db",
      authDomain: "student-housing-db.firebaseapp.com",
      storageBucket: "student-housing-db.appspot.com",
      measurementId: "G-Y85GR73R4B",
      androidClientId: "997141921548-vh53d2d1dcckitdhocgjord2dl0jkbuu.apps.googleusercontent.com",
      iosClientId: "997141921548-mvfia8o80frr23gkfnr9atclk4r5i67q.apps.googleusercontent.com",
    ),
  );

  // Future completion checker
  initializationFuture.then((_) {
    if (kDebugMode) {
      runApp(const MyApp());
    }
  }).catchError((error) {
    if (kDebugMode) {
      print('Firebase initialization error: $error');
    }
  });

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
          if (kDebugMode) {
            print("User is Logged in? $isLoggedIn");
          }
          return MaterialApp(
            title: 'Student Housing Finder Mobile',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              buttonTheme: const ButtonThemeData(
                buttonColor: Color.fromARGB(255, 4, 8, 230),
                minWidth: double.infinity, // Make buttons expand horizontally
                height: double.infinity, // Make buttons expand vertically
              ),
              colorScheme: const ColorScheme(
                primary: Color(0xFF606C38),
                secondary: Color(0xFF283618),
                surface: Colors.white,
                background: Color(0xFFF1F4F8),
                error: Colors.red,
                onPrimary: Colors.white,
                onSecondary: Colors.white,
                onSurface: Colors.black,
                onBackground: Colors.black,
                onError: Colors.white,
                brightness: Brightness.light,
              ),
              textTheme: const TextTheme(
                displayLarge: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0,
                  fontFamily: 'Outfit',
                ),
              ),
              // Other theme properties...
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
            ),
            themeMode: ThemeMode.light,
            initialRoute: isLoggedIn ? '/home' : '/',
            routes: {
              '/': (context) => const LoginPage(),
              '/home': (context) => const HomePage(),
              '/housing':(context) => const Placeholder(),
            },
          );
        }
      },
    );
  }
}
//flutter run -d chrome --web-renderer html
//Run the above to resolve image issue, but idk why