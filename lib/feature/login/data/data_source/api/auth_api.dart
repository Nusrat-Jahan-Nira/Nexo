// lib/feature/login/data/api/auth_api.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/req_model/login_request.dart';

class AuthApi {
  final FirebaseAuth _firebaseAuth;

  AuthApi(this._firebaseAuth);

//   Future<UserCredentialDto> signInWithEmailAndPassword(LoginRequest request) async {
//   try {
//     final credential = await _firebaseAuth.signInWithEmailAndPassword(
//       email: request.email,
//       password: request.password,
//     );
//
//     // Add debugging to see what's being returned
//     debugPrint("User ID: ${credential.user?.uid}");
//     debugPrint("User object type: ${credential.user.runtimeType}");
//
//     return UserCredentialDto.fromUserCredential(credential);
//   } catch (e, stackTrace) {
//     debugPrint("Firebase Authentication Error: $e");
//     debugPrint("Stack trace: $stackTrace");
//
//     // Re-throw with more context
//     throw Exception("Failed to login: $e");
//   }
// }

  Future<dynamic> signInWithEmailAndPassword(LoginRequest request) async {
    try {
      if (kDebugMode) {
        debugPrint("Login : ${request.email}");
      }
      if (kDebugMode) {
        debugPrint("Login : ${request.password}");
      }

      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );

      // final tempvalue =  UserCredentialDto(
      //   uid: credential.user?.uid,
      //   email: credential.user?.email,
      //   phoneNumber: credential.user?.phoneNumber,
      //   emailVerified: credential.user?.emailVerified,
      //   photoURL: credential.user?.photoURL,
      // );
      //
      // debugPrint(tempvalue);

      return credential;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        debugPrint("Login error: $e");
      }
      if (kDebugMode) {
        debugPrint("StackTrace: $stackTrace");
      }
      throw Exception("Failed to login: $e");
    }
  }

  Future<dynamic> createUserWithEmailAndPassword(
    LoginRequest request, {
    String? displayName,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );
      if (displayName != null && displayName.isNotEmpty) {
        await credential.user?.updateDisplayName(displayName);
      }
      return credential;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        debugPrint("Registration error: $e");
      }
      if (kDebugMode) {
        debugPrint("StackTrace: $stackTrace");
      }
      throw Exception("Failed to register: $e");
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      debugPrint("Sending password reset email to: $email");
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e, stackTrace) {
      debugPrint("Send password reset email error: $e");
      debugPrint("StackTrace: $stackTrace");
      throw Exception("Failed to send password reset email: $e");
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      debugPrint("Sending email verification");
      await _firebaseAuth.currentUser?.sendEmailVerification();
    } catch (e, stackTrace) {
      debugPrint("Send email verification error: $e");
      debugPrint("StackTrace: $stackTrace");
      throw Exception("Failed to send email verification: $e");
    }
  }

  bool get isEmailVerified => _firebaseAuth.currentUser?.emailVerified ?? false;

  Future<void> reloadUser() async {
    await _firebaseAuth.currentUser?.reload();
  }
}
