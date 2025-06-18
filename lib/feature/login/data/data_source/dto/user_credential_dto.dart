// lib/feature/login/data/model/dto/user_credential_dto.dart
import 'package:firebase_auth/firebase_auth.dart';

// class UserCredentialDto {
//   final String? uid;
//   final String? email;
//   final String? token;
//
//   UserCredentialDto({this.uid, this.email, this.token});
//
//   // Use a static method instead of an async factory constructor
//   static Future<UserCredentialDto> fromUserCredential(UserCredential credential) async {
//     final token = await credential.user?.getIdToken();
//     return UserCredentialDto(
//       uid: credential.user?.uid,
//       email: credential.user?.email,
//       token: token,
//     );
//   }
// }

// lib/feature/login/data/data_source/dto/user_credential_dto.dart
import 'package:firebase_auth/firebase_auth.dart';

class UserCredentialDto {
  final String? uid;
  final String? email;
  final String? phoneNumber;
  final bool? emailVerified;
  final String? photoURL;

  UserCredentialDto({
    this.uid,
    this.email,
    this.phoneNumber,
    this.emailVerified,
    this.photoURL,
  });

  // Factory constructor to safely create from Firebase UserCredential
  factory UserCredentialDto.fromUserCredential(UserCredential credential) {
    final user = credential.user;
    return UserCredentialDto(
      uid: user?.uid,
      email: user?.email,
      phoneNumber: user?.phoneNumber,
      emailVerified: user?.emailVerified,
      photoURL: user?.photoURL,
    );
  }

  // Helper method to check if user is authenticated
  bool get isAuthenticated => uid != null;
}