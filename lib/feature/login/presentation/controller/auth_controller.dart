// lib/presentation/controllers/auth_controller.dart
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class AuthController extends StateNotifier<AuthState> {
//   AuthController() : super(const AuthState());
//
//   Future<void> login(String email, String password) async {
//     state = state.copyWith(isLoading: true, errorMessage: null);
//
//     try {
//       // Validate credentials first
//       validateCredentials(email, password);
//
//       // Simulate network delay
//       await Future.delayed(const Duration(seconds: 1));
//
//       // Simulate network delay for login attempt
//       await Future.delayed(const Duration(seconds: 1));
//       // Here you would add your actual authentication logic
//       // For example, API call to your backend service
//       state = state.copyWith(isAuthenticated: true, isLoading: false);
//     } catch (e) {
//       state = state.copyWith(
//         isLoading: false,
//         errorMessage: e.toString(),
//         isAuthenticated: false,
//       );
//     }
//   }
//
//   void validateCredentials(String email, String password) {
//     if (email.isEmpty || password.isEmpty) {
//       throw Exception('Email and password cannot be empty');
//     }
//
//     // Email format validation
//     final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//     if (!emailRegex.hasMatch(email)) {
//       throw Exception('Please enter a valid email address');
//     }
//
//     // Password validation
//     if (password.length < 8) {
//       throw Exception('Password must be at least 8 characters long');
//     }
//
//     // Check for password complexity
//     bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
//     bool hasDigit = password.contains(RegExp(r'[0-9]'));
//     bool hasSpecialChar = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
//     if (!hasUppercase || !hasDigit || !hasSpecialChar) {
//       throw Exception('Password must contain at least one uppercase letter, one number, and one special character');
//     }
//   }
//
//   void logout() {
//     state = const AuthState();
//   }
//
//   void togglePasswordVisibility() {
//     state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
//   }
//
// }
//
// final authControllerProvider = StateNotifierProvider<AuthController, AuthState>((ref) {
//   return AuthController();
// });

import 'package:nexo/feature/login/domain/req_model/login_request.dart';
import 'package:nexo/feature/login/domain/usecase/login_usecase.dart';
import 'package:nexo/feature/login/di/login_providers.dart';

import '../../domain/model/auth_state.dart';

class AuthController extends Notifier<AuthState> {
  LoginUsecase get _loginUseCase => ref.read(loginUsecaseProvider);

  @override
  AuthState build() => const AuthState();

  Future<void> login(LoginRequest loginRequest) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      validateCredentials(loginRequest);

      // Call login use case
      final userCredential = await _loginUseCase.loginBusiness(loginRequest);

      // Check if authentication was successful
      // Authentication succeeded
      state = state.copyWith(
        isAuthenticated: true,
        isLoading: false,
        isEmailVerified: userCredential.emailVerified ?? false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
        isAuthenticated: false,
      );

      if (kDebugMode) {
        debugPrint("AuthController Error: $e");
      }
    }
  }

  Future<void> register(LoginRequest loginRequest, {String? displayName}) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      validateCredentials(loginRequest);

      final userCredential = await _loginUseCase.registerBusiness(
        loginRequest,
        displayName: displayName,
      );

      if (userCredential.emailVerified != true) {
        await _loginUseCase.emailVerificationBusiness();
      }

      state = state.copyWith(
        isAuthenticated: true,
        isLoading: false,
        isEmailVerified: userCredential.emailVerified ?? false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
        isAuthenticated: false,
      );

      if (kDebugMode) {
        debugPrint("AuthController Error: $e");
      }
    }
  }

  void validateCredentials(LoginRequest loginRequest) {
    if (loginRequest.email.isEmpty || loginRequest.password.isEmpty) {
      throw Exception('Email and password cannot be empty');
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(loginRequest.email)) {
      throw Exception('Please enter a valid email address');
    }

    if (loginRequest.password.length < 8) {
      throw Exception('Password must be at least 8 characters long');
    }

    bool hasUppercase = loginRequest.password.contains(RegExp(r'[A-Z]'));
    bool hasDigit = loginRequest.password.contains(RegExp(r'[0-9]'));
    bool hasSpecialChar =
        loginRequest.password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    if (!hasUppercase || !hasDigit || !hasSpecialChar) {
      throw Exception(
          'Password must contain at least one uppercase letter, one number, and one special character');
    }
  }

  void logout() {
    state = const AuthState();
  }

  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  Future<bool> sendPasswordReset(String email) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      await _loginUseCase.forgotPasswordBusiness(email);
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
      if (kDebugMode) {
        debugPrint("AuthController Error: $e");
      }
      return false;
    }
  }

  Future<void> resendVerificationEmail() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      await _loginUseCase.emailVerificationBusiness();
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
      debugPrint("AuthController Error: $e");
    }
  }
}

final authControllerProvider = NotifierProvider<AuthController, AuthState>(() {
  return AuthController();
});
