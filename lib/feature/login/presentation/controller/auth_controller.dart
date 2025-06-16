// lib/presentation/controllers/auth_controller.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/domain/model/auth_state.dart';

class AuthController extends StateNotifier<AuthState> {
  AuthController() : super(const AuthState());

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      // Validate credentials first
      validateCredentials(email, password);

      // Simulate network delay
      await Future.delayed(const Duration(seconds: 1));

      // Simulate network delay for login attempt
      await Future.delayed(const Duration(seconds: 1));
      // Here you would add your actual authentication logic
      // For example, API call to your backend service
      state = state.copyWith(isAuthenticated: true, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
        isAuthenticated: false,
      );
    }
  }

  void validateCredentials(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      throw Exception('Email and password cannot be empty');
    }

    // Email format validation
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      throw Exception('Please enter a valid email address');
    }

    // Password validation
    if (password.length < 8) {
      throw Exception('Password must be at least 8 characters long');
    }

    // Check for password complexity
    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    bool hasDigit = password.contains(RegExp(r'[0-9]'));
    bool hasSpecialChar = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    if (!hasUppercase || !hasDigit || !hasSpecialChar) {
      throw Exception('Password must contain at least one uppercase letter, one number, and one special character');
    }
  }

  void logout() {
    state = const AuthState();
  }

  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

}

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController();
});
