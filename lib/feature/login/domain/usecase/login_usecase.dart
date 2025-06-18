import 'package:injectable/injectable.dart';
import 'package:nexo/feature/login/domain/business/login_business.dart';
import 'package:nexo/feature/login/domain/business/logout_business.dart';

import '../req_model/login_request.dart';

class LoginUsecase {
  final LoginBusiness loginBusiness;
  final LogoutBusiness logoutBusiness;


  LoginUsecase({
    required this.loginBusiness,
    required this.logoutBusiness,

  });

}
