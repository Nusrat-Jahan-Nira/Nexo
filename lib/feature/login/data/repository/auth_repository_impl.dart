// lib/core/data/repositories/auth_repository_impl.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/util/exceptions/exception_util.dart';
import '../../domain/repository/auth_repository.dart';

import '../../domain/req_model/login_request.dart';
import '../data_source/api/auth_api.dart';
import '../data_source/dto/user_credential_dto.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final AuthApi _authApi;

  AuthRepositoryImpl(this._authApi);

  // @override
  // Future<UserCredentialDto> login(LoginRequest loginRequest) async {
  //   // Pass the request object to the API and return the result
  //   return await _authApi.signInWithEmailAndPassword(loginRequest);
  // }

  @override
  Future<UserCredentialDto> login(LoginRequest loginRequest) async {
    try {
      //return await _authApi.signInWithEmailAndPassword(loginRequest);
      final result = await _authApi.signInWithEmailAndPassword(loginRequest);

      final tempvalue = UserCredentialDto(
        uid: result.user?.uid,
        email: result.user?.email,
        phoneNumber: result.user?.phoneNumber,
        emailVerified: result.user?.emailVerified,
        photoURL: result.user?.photoURL,
      );

      if (kDebugMode) {
        print(tempvalue);
      }

      if (kDebugMode) {
        print("Auth API result: $result");
      } // Print the result for debugging
      return tempvalue;
    } on FirebaseAuthException catch (e) {
      throw ExceptionUtil.handleFirebaseException<UserCredentialDto>(e);
    }
  }

  @override
  Future<UserCredentialDto> register(LoginRequest loginRequest, {String? displayName}) async {
    try {
      final result = await _authApi.createUserWithEmailAndPassword(
        loginRequest,
        displayName: displayName,
      );
      return UserCredentialDto(
        uid: result.user?.uid,
        email: result.user?.email,
        phoneNumber: result.user?.phoneNumber,
        emailVerified: result.user?.emailVerified,
        photoURL: result.user?.photoURL,
      );
    } on FirebaseAuthException catch (e) {
      throw ExceptionUtil.handleFirebaseException<UserCredentialDto>(e);
    }
  }

  @override
  Future<void> logout() async {
    await _authApi.signOut();
  }

  @override
  Stream<bool> get authStateChanges =>
      _authApi.authStateChanges.map((user) => user != null);

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _authApi.sendPasswordResetEmail(email);
    } on FirebaseAuthException catch (e) {
      throw ExceptionUtil.handleFirebaseException<void>(e);
    }
  }

  @override
  Future<void> sendEmailVerification() async {
    await _authApi.sendEmailVerification();
  }

  @override
  bool get isEmailVerified => _authApi.isEmailVerified;

  @override
  Future<void> reloadUser() async {
    await _authApi.reloadUser();
  }
}
