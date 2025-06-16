// lib/domain/models/auth_state.dart
import 'package:flutter/foundation.dart';

@immutable
class AuthState {
  final bool isLoading;
  final String? errorMessage;
  final bool isAuthenticated;
  final bool isPasswordVisible;

  const AuthState({
    this.isLoading = false,
    this.errorMessage,
    this.isAuthenticated = false,
    this.isPasswordVisible = false,
  });

  AuthState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isAuthenticated,
    bool? isPasswordVisible,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }
}