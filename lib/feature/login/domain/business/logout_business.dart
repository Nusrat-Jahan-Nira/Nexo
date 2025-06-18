import 'package:injectable/injectable.dart';

import '../repository/auth_repository.dart';

class LogoutBusiness {
  final IAuthRepository repository;

  LogoutBusiness(this.repository);

  Future<void> call() {
    return repository.logout();
  }
}