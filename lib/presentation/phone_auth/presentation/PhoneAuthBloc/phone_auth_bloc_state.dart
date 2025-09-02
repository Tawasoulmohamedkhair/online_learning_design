import 'package:equatable/equatable.dart';

abstract class PhoneAuthState extends Equatable {
  const PhoneAuthState();

  @override
  List<Object> get props => [];
}

class PhoneAuthInitial extends PhoneAuthState {}

class PhoneAuthLoading extends PhoneAuthState {}

class PhoneAuthSuccess extends PhoneAuthState {}

class VerificationSuccess extends PhoneAuthState {}

class PhoneAuthError extends PhoneAuthState {
  final String message;
  const PhoneAuthError(this.message);

  @override
  List<Object> get props => [message];
}

class OtpSent extends PhoneAuthState {}

class PhoneAuthCodeSent extends PhoneAuthState {
  final String phoneNumber;
  final String verificationId;

  const PhoneAuthCodeSent({required this.phoneNumber, required this.verificationId});
}


class PhoneAuthVerified extends PhoneAuthState {
  final String phoneNumber;

  const PhoneAuthVerified(this.phoneNumber);
}
