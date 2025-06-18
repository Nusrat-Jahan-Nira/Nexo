import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/util/app_theme.dart';
import 'core/presentation/view/splash_screen.dart';
import 'package:get_it/get_it.dart';

import 'feature/login/di/login_module.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  LoginModule.dependencies();
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  await Firebase.initializeApp();

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const ProviderScope(child: NexoApp(),));
}

class NexoApp extends StatelessWidget {
  const NexoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nexo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const SplashScreen(),
    );
  }
}