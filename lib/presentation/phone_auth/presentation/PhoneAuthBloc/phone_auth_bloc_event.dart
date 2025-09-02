import 'package:equatable/equatable.dart';

abstract class PhoneAuthEvent extends Equatable {
  const PhoneAuthEvent();

  @override
  List<Object> get props => [];
}

class PhoneNumberSubmitted extends PhoneAuthEvent {
  final String phoneNumber;
  const PhoneNumberSubmitted(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}
class PhoneNumberVerified extends PhoneAuthEvent {
  const PhoneNumberVerified();
}
class OtpCodeSubmitted extends PhoneAuthEvent {
  final String phoneNumber;
  final String otpCode;
  const OtpCodeSubmitted(this.phoneNumber, this.otpCode);

  @override
  List<Object> get props => [phoneNumber, otpCode];
}
class VerifyOtpEvent extends PhoneAuthEvent {
  final String phoneNumber; 
  final String verificationId;
  final String otpCode;

  VerifyOtpEvent({
    required this.phoneNumber,
    required this.verificationId,
    required this.otpCode,
  });
}

