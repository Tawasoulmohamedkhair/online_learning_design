import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

abstract class PhoneAuthRemoteDataSource {
  Future<String> submitPhoneNumber(String phoneNumber);
  Future<void> verifyOtp(String phoneNumber, String otpCode);
}

class PhoneAuthRemoteDataSourceImpl implements PhoneAuthRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<String> submitPhoneNumber(String phoneNumber) async {
    final completer = Completer<String>();

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        completer.completeError(e);
      },
      codeSent: (String verificationId, int? resendToken) {
        completer.complete(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );

    return completer.future;
  }

  @override
  Future<void> verifyOtp(String phoneNumber, String otpCode) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: phoneNumber,
      smsCode: otpCode,
    );
    await _auth.signInWithCredential(credential);
  }
}
