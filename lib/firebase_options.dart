// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB2ye5vscFm1eiOiPVBIQ8np-CnGNk4DQc',
    appId: '1:997141921548:web:09ad4be66b79bed6e8d329',
    messagingSenderId: '997141921548',
    projectId: 'student-housing-db',
    authDomain: 'student-housing-db.firebaseapp.com',
    storageBucket: 'student-housing-db.appspot.com',
    measurementId: 'G-8KXXJEN96D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_wnLFbkEfoqY-1cv8R0zoEvS67wF8U6o',
    appId: '1:997141921548:android:db0e89bcd514c27ae8d329',
    messagingSenderId: '997141921548',
    projectId: 'student-housing-db',
    storageBucket: 'student-housing-db.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAvM14Zr4CQnHG3n593Ldc_Zi_yLYgK6oo',
    appId: '1:997141921548:ios:75a0d8d24c58769ae8d329',
    messagingSenderId: '997141921548',
    projectId: 'student-housing-db',
    storageBucket: 'student-housing-db.appspot.com',
    iosClientId: '997141921548-mvfia8o80frr23gkfnr9atclk4r5i67q.apps.googleusercontent.com',
    iosBundleId: 'com.studenthousingdbproject.studentHousingMobile',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAvM14Zr4CQnHG3n593Ldc_Zi_yLYgK6oo',
    appId: '1:997141921548:ios:75a0d8d24c58769ae8d329',
    messagingSenderId: '997141921548',
    projectId: 'student-housing-db',
    storageBucket: 'student-housing-db.appspot.com',
    iosClientId: '997141921548-mvfia8o80frr23gkfnr9atclk4r5i67q.apps.googleusercontent.com',
    iosBundleId: 'com.studenthousingdbproject.studentHousingMobile',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB2ye5vscFm1eiOiPVBIQ8np-CnGNk4DQc',
    appId: '1:997141921548:web:70ec9011eff4595be8d329',
    messagingSenderId: '997141921548',
    projectId: 'student-housing-db',
    authDomain: 'student-housing-db.firebaseapp.com',
    storageBucket: 'student-housing-db.appspot.com',
    measurementId: 'G-Y85GR73R4B',
  );
}
