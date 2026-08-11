
import '../repository/auth_repository.dart';

class EmailVerificationBusiness {
  final IAuthRepository repository;

  EmailVerificationBusiness(this.repository);

  Future<void> call() {
    return repository.sendEmailVerification();
  }

  bool get isEmailVerified => repository.isEmailVerified;

  Future<void> reloadUser() {
    return repository.reloadUser();
  }
}
