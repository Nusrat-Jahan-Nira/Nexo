import 'package:nexo/feature/login/domain/business/login_business.dart';
import 'package:nexo/feature/login/domain/business/logout_business.dart';
import 'package:nexo/feature/login/domain/business/forgot_password_business.dart';
import 'package:nexo/feature/login/domain/business/email_verification_business.dart';
import 'package:nexo/feature/login/domain/business/register_business.dart';


class LoginUsecase {
  final LoginBusiness loginBusiness;
  final LogoutBusiness logoutBusiness;
  final ForgotPasswordBusiness forgotPasswordBusiness;
  final EmailVerificationBusiness emailVerificationBusiness;
  final RegisterBusiness registerBusiness;


  LoginUsecase({
    required this.loginBusiness,
    required this.logoutBusiness,
    required this.forgotPasswordBusiness,
    required this.emailVerificationBusiness,
    required this.registerBusiness,

  });

}
