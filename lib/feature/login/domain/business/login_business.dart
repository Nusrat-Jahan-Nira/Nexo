import 'package:injectable/injectable.dart';

import '../../data/data_source/dto/user_credential_dto.dart';
import '../repository/auth_repository.dart';
import '../req_model/login_request.dart';


class LoginBusiness {
  final IAuthRepository repository;

  LoginBusiness(this.repository);

  Future<UserCredentialDto> call(LoginRequest loginRequest) async {
    try {
      return await repository.login(loginRequest);
    } catch (e, stackTrace) {
      // Log the error and stack trace
      print('Login error: '
          '\$e\nStackTrace: \$stackTrace');
      // Rethrow or transform the exception
      throw Exception('Failed to login: \\${e.toString()}');
    }
  }
}
