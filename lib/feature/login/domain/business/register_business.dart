import 'package:flutter/foundation.dart';

import '../../data/data_source/dto/user_credential_dto.dart';
import '../repository/auth_repository.dart';
import '../req_model/login_request.dart';

class RegisterBusiness {
  final IAuthRepository repository;

  RegisterBusiness(this.repository);

  Future<UserCredentialDto> call(LoginRequest loginRequest, {String? displayName}) async {
    try {
      return await repository.register(loginRequest, displayName: displayName);
    } catch (e) {
      debugPrint('Registration error: $e');
      throw Exception('Failed to register: ${e.toString()}');
    }
  }
}
