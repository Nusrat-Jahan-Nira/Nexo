// lib/core/domain/repositories/auth_repository.dart
import '../../data/data_source/dto/user_credential_dto.dart';
import '../req_model/login_request.dart';

abstract class IAuthRepository {
  Future<UserCredentialDto> login(LoginRequest loginRequest);
  Future<void> logout();
  Stream<bool> get authStateChanges;
}