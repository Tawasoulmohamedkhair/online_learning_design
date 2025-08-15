import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_design/core/components/custom_elevated_button.dart';
import 'package:online_learning_design/core/components/custom_text_form_field.dart';
import 'package:online_learning_design/generated/l10n.dart';
import 'package:online_learning_design/presentation/auth/authbloc/auth_bloc.dart';
import 'package:online_learning_design/presentation/auth/authbloc/auth_event.dart';
import 'package:online_learning_design/presentation/auth/authbloc/auth_state.dart';
import 'package:online_learning_design/presentation/auth/componante/auth_link.dart';
import 'package:online_learning_design/presentation/auth/componante/terms_check_box.dart';
import 'package:online_learning_design/presentation/auth/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                    S.of(context).sign_up,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1F1F39),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    S.of(context).enteryourdetailsbelowfreesignup,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffB8B8D2),
                    ),
                  ),
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
                  child: BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthLoading) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(S.of(context).processingsignup),
                          ),
                        );
                      } else if (state is AuthSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(S.of(context).signupsuccessful),
                          ),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      } else if (state is AuthFailure) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.error)));
                      }
                    },
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextFormFields(
                            title: S.of(context).yourEmail,
                            hintText: 'Cooper_Kristin@gmail.com',
                            controller: _emailController,
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
                          CustomTextFormFields(
                            title: S.of(context).confirmPassword,
                            hintText: '••••••••••••',
                            controller: _confirmPasswordController,
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
                              if (value != _passwordController.text) {
                                return S.of(context).passwordsdonotmatch;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          BlocBuilder<AuthBloc, AuthState>(
                            buildWhen:
                                (previous, current) =>
                                    current is AuthTermsState,
                            builder: (context, state) {
                              if (state is AuthTermsState) {}
                              return TermsCheckBox(
                                onChecked: (value) {
                                  context.read<AuthBloc>().add(
                                    const TermsToggled(),
                                  );
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomElevatedButton(
                            width: 327,
                            backgroundColor: Color(0xff3D5CFF),

                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthBloc>().add(
                                  SignUpRequested(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                              }
                            },
                            label: Text(
                              S.of(context).creataccount,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          AuthLink(
                            text: S.of(context).alreadyhaveanaccount,
                            text1: S.of(context).sign_in,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
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
