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