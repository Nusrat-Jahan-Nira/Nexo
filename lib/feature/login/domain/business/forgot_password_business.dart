
import '../repository/auth_repository.dart';

class ForgotPasswordBusiness {
  final IAuthRepository repository;

  ForgotPasswordBusiness(this.repository);

  Future<void> call(String email) {
    return repository.sendPasswordResetEmail(email);
  }
}
