import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/services.dart';

class BackEnd {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Method to get current user from FirebaseAuth
  Future<User?> getCurrentUser() async {
    try {
      return _auth.currentUser;
    } catch (e) {
      // Handle error if any
      if (kDebugMode) {
        print('Error getting current user: $e');
      }
      return null;
    }
  }

  // Method to sign in with Google
  Future<User?> signInWithGoogle() async {
    try {
      // Start the Google Sign-In process
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        // Get the authentication details
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

        // Get the Google credentials
        final String accessToken = googleAuth.accessToken ?? '';
        final String idToken = googleAuth.idToken ?? '';

        // Create a credential from the Google access and ID tokens
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: accessToken,
          idToken: idToken,
        );

        // Sign in with Firebase using the credential
        final UserCredential userCredential = await _auth.signInWithCredential(credential);

        // Return the signed-in user
        return userCredential.user;
      }
    } catch (e) {
      // Handle sign-in error
      if (kDebugMode) {
        print('Google Sign-In Error: ${e.toString()}');
      }
      return null;
    }
    return null;
  }

  // Method to sign in anonymously
  Future<User?> signInAnonymously() async {
    try {
      final UserCredential userCredential = await _auth.signInAnonymously();
      return userCredential.user;
    } catch (e) {
      // Handle sign-in error
      if (kDebugMode) {
        print('Error signing in anonymously: $e');
      }
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      // Sign out from Google
      await _googleSignIn.disconnect();
      await _googleSignIn.signOut();

      // Sign out from Firebase
      await _auth.signOut();
    } on PlatformException catch (e) {
      // Handle sign-out errors
      if (e.code == 'sign_out_canceled') {
        // User canceled sign-out
        if (kDebugMode) {
          print('Sign-Out Canceled');
        }
      } else {
        // Other sign-out errors
        if (kDebugMode) {
          print('Other Sign-Out Error: $e');
        }
      }
    } catch (e) {
      // Handle other errors
      if (kDebugMode) {
        print('Try Catch Sign-Out Error: $e');
      }
    }
  }
}
