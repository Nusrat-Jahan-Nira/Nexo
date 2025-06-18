import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../main.dart';
import '../data/data_source/api/auth_api.dart';
import '../data/repository/auth_repository_impl.dart';
import '../domain/business/login_business.dart';
import '../domain/business/logout_business.dart';
import '../domain/repository/auth_repository.dart';
import '../domain/usecase/login_usecase.dart';

class LoginModule {
  static void dependencies() {
    // Firebase instances
    getIt.registerLazySingleton<FirebaseAuth>(
      () => FirebaseAuth.instance,
    );

    // API layer
    getIt.registerLazySingleton<AuthApi>(
      () => AuthApi(getIt<FirebaseAuth>()),
    );

    // Repository layer
    getIt.registerLazySingleton<IAuthRepository>(
      () => AuthRepositoryImpl(getIt<AuthApi>()),
    );

    // Business layer
    getIt.registerLazySingleton<LoginBusiness>(
      () => LoginBusiness(getIt<IAuthRepository>()),
    );

    getIt.registerLazySingleton<LogoutBusiness>(
      () => LogoutBusiness(getIt<IAuthRepository>()),
    );

    // Use case layer
    getIt.registerLazySingleton<LoginUsecase>(() => LoginUsecase(
      loginBusiness: getIt<LoginBusiness>(),
      logoutBusiness: getIt<LogoutBusiness>(),
    ));
  }
}