// lib/feature/login/data/api/auth_api.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/req_model/login_request.dart';
import '../dto/user_credential_dto.dart';

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
//     print("User ID: ${credential.user?.uid}");
//     print("User object type: ${credential.user.runtimeType}");
//
//     return UserCredentialDto.fromUserCredential(credential);
//   } catch (e, stackTrace) {
//     print("Firebase Authentication Error: $e");
//     print("Stack trace: $stackTrace");
//
//     // Re-throw with more context
//     throw Exception("Failed to login: $e");
//   }
// }

  Future<UserCredentialDto> signInWithEmailAndPassword(LoginRequest request) async {
    try {
      print("Login : ${request.email}");
      print("Login : ${request.password}");

      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );

      final tempvalue =  UserCredentialDto(
        uid: credential.user?.uid,
        email: credential.user?.email,
        phoneNumber: credential.user?.phoneNumber,
        emailVerified: credential.user?.emailVerified,
        photoURL: credential.user?.photoURL,
      );

      print(tempvalue);

      return tempvalue;

    } catch (e, stackTrace) {
      print("Login error: $e");
      print("StackTrace: $stackTrace");
      throw Exception("Failed to login: $e");
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
}
