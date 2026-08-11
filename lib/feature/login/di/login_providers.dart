import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/data_source/api/auth_api.dart';
import '../data/repository/auth_repository_impl.dart';
import '../domain/business/login_business.dart';
import '../domain/business/logout_business.dart';
import '../domain/business/forgot_password_business.dart';
import '../domain/business/email_verification_business.dart';
import '../domain/business/register_business.dart';
import '../domain/repository/auth_repository.dart';
import '../domain/usecase/login_usecase.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authApiProvider = Provider<AuthApi>((ref) => AuthApi(ref.watch(firebaseAuthProvider)));

final authRepositoryProvider = Provider<IAuthRepository>(
  (ref) => AuthRepositoryImpl(ref.watch(authApiProvider)),
);

final loginBusinessProvider =
    Provider<LoginBusiness>((ref) => LoginBusiness(ref.watch(authRepositoryProvider)));

final logoutBusinessProvider =
    Provider<LogoutBusiness>((ref) => LogoutBusiness(ref.watch(authRepositoryProvider)));

final forgotPasswordBusinessProvider = Provider<ForgotPasswordBusiness>(
  (ref) => ForgotPasswordBusiness(ref.watch(authRepositoryProvider)),
);

final emailVerificationBusinessProvider = Provider<EmailVerificationBusiness>(
  (ref) => EmailVerificationBusiness(ref.watch(authRepositoryProvider)),
);

final registerBusinessProvider =
    Provider<RegisterBusiness>((ref) => RegisterBusiness(ref.watch(authRepositoryProvider)));

final loginUsecaseProvider = Provider<LoginUsecase>((ref) => LoginUsecase(
      loginBusiness: ref.watch(loginBusinessProvider),
      logoutBusiness: ref.watch(logoutBusinessProvider),
      forgotPasswordBusiness: ref.watch(forgotPasswordBusinessProvider),
      emailVerificationBusiness: ref.watch(emailVerificationBusinessProvider),
      registerBusiness: ref.watch(registerBusinessProvider),
    ));
