import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/model/resource.dart';

class ExceptionUtil {


  static Resource<T> handleFirebaseException<T>(FirebaseAuthException e) {
    String errorMessage;
    int? errorCode;

    switch (e.code) {
      case 'user-not-found':
        errorMessage = 'No user found with this email';
        break;
      case 'wrong-password':
        errorMessage = 'Incorrect password';
        break;
      case 'user-disabled':
        errorMessage = 'This account has been disabled';
        break;
      case 'invalid-credential':
        errorMessage = 'Invalid email or password';
        break;
      case 'email-already-in-use':
        errorMessage = 'Email is already in use';
        break;
      case 'weak-password':
        errorMessage = 'Password is too weak';
        break;
      default:
        errorMessage = 'Authentication failed: ${e.message}';
        break;
    }

    return Resource.error(errorMessage, errorCode);
  }
}