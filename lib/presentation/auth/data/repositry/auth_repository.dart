import 'package:flutter/material.dart';

abstract class AuthRepository {
  Future<void> signUp(String email, String password);
  Future<void> login(String email, String password);
}

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<void> signUp(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    debugPrint('Signing up user: $email');
    debugPrint('Sign up successful!');
  }

  @override
  Future<void> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    if (email.isNotEmpty && password.isNotEmpty) {
      debugPrint('Logging in user: $email');
      debugPrint('Login successful!');
    } else {
      throw Exception('Invalid email or password');
    }
  }
}
