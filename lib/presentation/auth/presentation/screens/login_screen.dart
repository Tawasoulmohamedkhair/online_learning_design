import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_design/core/components/custom_elevated_button.dart';
import 'package:online_learning_design/core/components/custom_text_form_field.dart';
import 'package:online_learning_design/generated/l10n.dart';
import 'package:online_learning_design/presentation/auth/presentation/authbloc/auth_bloc.dart';
import 'package:online_learning_design/presentation/auth/presentation/authbloc/auth_event.dart';
import 'package:online_learning_design/presentation/auth/presentation/authbloc/auth_state.dart';
import 'package:online_learning_design/presentation/auth/presentation/componante/auth_link.dart';
import 'package:online_learning_design/presentation/auth/presentation/componante/forget_password_link.dart';
import 'package:online_learning_design/presentation/auth/presentation/componante/social_login_button.dart';
import 'package:online_learning_design/presentation/auth/presentation/componante/social_login_divider.dart';
import 'package:online_learning_design/presentation/auth/presentation/screens/sign_up_screen.dart';
import 'package:online_learning_design/presentation/phone_auth/presentation/screens/phone_auth_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).sign_in,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1F1F39),
                    ),
                  ),
                  SizedBox(height: 4),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSuccess) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PhoneAuthScreen(),
                          ),
                        );
                      } else if (state is AuthFailure) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.error)));
                      }
                    },
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextFormFields(
                              title: S.of(context).yourEmail,
                              hintText: 'Cooper_Kristin@gmail.com',
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return S.of(context).pleaseenteryouremail;
                                }
                                if (!RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                ).hasMatch(value)) {
                                  return S.of(context).enteravalidemailaddress;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            CustomTextFormFields(
                              title: S.of(context).password,
                              hintText: '••••••••••••',
                              controller: _passwordController,
                              keyboardType: TextInputType.emailAddress,
                              obscureText: !_isPasswordVisible,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return S.of(context).pleaseenteryourpassword;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            ForgetPasswordLink(),
                            CustomElevatedButton(
                              width: 327,
                              backgroundColor: Color(0xff3D5CFF),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthBloc>().add(
                                    LoginRequested(
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text.trim(),
                                    ),
                                  );
                                  log(_passwordController.text);
                                }
                              },
                              label: Text(
                                S.of(context).sign_in,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),

                            const SizedBox(height: 10),
                            AuthLink(
                              text: S.of(context).donthaveanaccount,
                              text1: S.of(context).sign_up,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpScreen(),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 10),
                            SocialLoginDivider(),
                            const SizedBox(height: 10),
                            SocialLoginButton(),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
