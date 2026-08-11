// lib/core/domain/repositories/auth_repository.dart
import '../../data/data_source/dto/user_credential_dto.dart';
import '../req_model/login_request.dart';

abstract class IAuthRepository {
  Future<UserCredentialDto> login(LoginRequest loginRequest);
  Future<UserCredentialDto> register(LoginRequest loginRequest, {String? displayName});
  Future<void> logout();
  Stream<bool> get authStateChanges;
  Future<void> sendPasswordResetEmail(String email);
  Future<void> sendEmailVerification();
  bool get isEmailVerified;
  Future<void> reloadUser();
}