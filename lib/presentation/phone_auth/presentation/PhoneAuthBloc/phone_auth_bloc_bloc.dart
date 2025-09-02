import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_design/core/error/failures.dart';
import 'package:online_learning_design/presentation/phone_auth/domin/usecases/submit_phone_number.dart';
import 'package:online_learning_design/presentation/phone_auth/domin/usecases/verify_otp.dart';
import 'package:online_learning_design/presentation/phone_auth/presentation/PhoneAuthBloc/phone_auth_bloc_event.dart';
import 'package:online_learning_design/presentation/phone_auth/presentation/PhoneAuthBloc/phone_auth_bloc_state.dart';

class PhoneAuthBloc extends Bloc<PhoneAuthEvent, PhoneAuthState> {
  final SubmitPhoneNumber submitPhoneNumber;
  final VerifyOtp verifyOtp;

  PhoneAuthBloc({required this.submitPhoneNumber, required this.verifyOtp})
    : super(PhoneAuthInitial()) {
    on<PhoneNumberSubmitted>(_onPhoneNumberSubmitted);
    on<OtpCodeSubmitted>(_onOtpCodeSubmitted);
  }

  Future<void> _onPhoneNumberSubmitted(
    PhoneNumberSubmitted event,
    Emitter<PhoneAuthState> emit,
  ) async {
    emit(PhoneAuthLoading());

    final result = await submitPhoneNumber(event.phoneNumber);

    result.fold(
      (failure) {
        String errorMessage = 'An unexpected error occurred';
        if (failure is ServerFailure) {
          errorMessage = 'Server is currently unavailable.';
        } else if (failure is NetworkFailure) {
          errorMessage = 'No internet connection.';
        }
        emit(PhoneAuthError(errorMessage));
      },
      (verificationId) {
        log('DEBUG: PhoneNumber=${event.phoneNumber}');
        log('DEBUG: VerificationId=$verificationId');

        emit(
          PhoneAuthCodeSent(
            phoneNumber: event.phoneNumber,
            verificationId: verificationId,
          ),
        );
      },
    );
  }

  Future<void> _onOtpCodeSubmitted(
    OtpCodeSubmitted event,
    Emitter<PhoneAuthState> emit,
  ) async {
    emit(PhoneAuthLoading());

    final result = await verifyOtp({
      'phoneNumber': event.phoneNumber,
      'otpCode': event.otpCode,
    });

    result.fold((failure) {
      String errorMessage = 'Invalid code.';
      if (failure is NetworkFailure) {
        errorMessage = 'No internet connection.';
      }
      emit(PhoneAuthError(errorMessage));
    }, (_) => emit(PhoneAuthVerified(event.phoneNumber)));
  }
}
