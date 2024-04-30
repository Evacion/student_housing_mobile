import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/services.dart';

class BackEnd {
  // Flag to track whether sign-in/sign-out process is in progress
  bool _isAuthOperationInProgress = false;
  // Singleton instance
  static final BackEnd _instance = BackEnd._internal();

  // Private constructor
  BackEnd._internal();

  // Factory method to return the singleton instance
  factory BackEnd({FirebaseAuth? auth, GoogleSignIn? googleSignIn}) {
    return _instance;
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> getCurrentUser() async {
    try {
      return _auth.currentUser; // Wait for the Future to complete
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print('Error getting current user: $e');
      }
      return null;
    }
  }

  Future<User?> signInWithGoogle() async {
    // Check if authentication operation is already in progress
    if (_isAuthOperationInProgress) {
      return null; // Return null to indicate operation is already in progress
    }

    try {
      _isAuthOperationInProgress = true; // Set flag to true

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final String accessToken = googleAuth.accessToken ?? '';
        final String idToken = googleAuth.idToken ?? '';

        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: accessToken,
          idToken: idToken,
        );

        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        return userCredential.user;
      }
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print('Google Sign-In Error: ${e.toString()}');
      }
      return null;
    } finally {
      _isAuthOperationInProgress = false; // Reset flag after operation completes
    }
    return null;
  }

  Future<User?> signInAnonymously() async {
    // Check if authentication operation is already in progress
    if (_isAuthOperationInProgress) {
      return null; // Return null to indicate operation is already in progress
    }

    try {
      _isAuthOperationInProgress = true; // Set flag to true

      final UserCredential userCredential =
          await _auth.signInAnonymously(); // Wait for the Future to complete
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print('Error signing in anonymously: $e');
      }
      return null;
    } finally {
      _isAuthOperationInProgress = false; // Reset flag after operation completes
    }
  }

  Future<void> signOut() async {
    if (_isAuthOperationInProgress) {
      return; // Return immediately if sign-out is already in progress
    }

    try {
      _isAuthOperationInProgress = true; // Set flag to true

      await _googleSignIn.signOut(); // Wait for the Future to complete
      await _auth.signOut(); // Wait for the Future to complete
    } on PlatformException {
      // Handle exceptions...
    } finally {
      _isAuthOperationInProgress = false; // Reset flag after operation completes
    }
  }
}
