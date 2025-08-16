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
