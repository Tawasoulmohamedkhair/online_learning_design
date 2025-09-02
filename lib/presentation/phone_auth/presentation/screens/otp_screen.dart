import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_learning_design/generated/l10n.dart';

import 'package:online_learning_design/presentation/phone_auth/presentation/screens/success_screen.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  final String verificationId;

  const OtpScreen({
    super.key,
    required this.phoneNumber,
    required this.verificationId,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );

  void _submitOtp() {
    String otp = _otpControllers.map((c) => c.text).join();
    if (otp.length < 6) return;

    final credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: otp,
    );

    FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((user) {
          log('DEBUG: Phone verified successfully');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => SuccessScreen()),
          );
        })
        .catchError((error) {
          log('DEBUG: OTP verification error: $error');
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('OTP verification failed.')));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).verifyPhone)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                S.of(context).codeSent(widget.phoneNumber),
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              Pinput(
                length: 6,
                keyboardType: TextInputType.phone,
                controller: _otpControllers[0],
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitOtp,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: Text(
                  S.of(context).verifyandCreateAccount,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
