// lib/core/domain/model/auth_state.dart
import 'package:flutter/foundation.dart';

@immutable
class AuthState {
  final bool isLoading;
  final bool isAuthenticated;
  final String? errorMessage;
  final bool isPasswordVisible;

  const AuthState({
    this.isLoading = false,
    this.isAuthenticated = false,
    this.errorMessage,
    this.isPasswordVisible = true,
  });

  AuthState copyWith({
    bool? isLoading,
    bool? isAuthenticated,
    String? errorMessage,
    bool? isPasswordVisible,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      errorMessage: errorMessage ?? this.errorMessage,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;
  //   return other is AuthState &&
  //       other.isLoading == isLoading &&
  //       other.isAuthenticated == isAuthenticated &&
  //       other.errorMessage == errorMessage &&
  //       other.isPasswordVisible == isPasswordVisible;
  // }
  //
  // @override
  // int get hashCode =>
  //     isLoading.hashCode ^
  //     isAuthenticated.hashCode ^
  //     errorMessage.hashCode ^
  //     isPasswordVisible.hashCode;
}