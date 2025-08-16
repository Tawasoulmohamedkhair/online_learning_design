import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_design/core/error/failures.dart';
import 'package:online_learning_design/presentation/phone_auth/domin/usecases/submit_phone_number.dart';
import 'package:online_learning_design/presentation/phone_auth/presentation/PhoneAuthBloc/phone_auth_bloc_event.dart';
import 'package:online_learning_design/presentation/phone_auth/presentation/PhoneAuthBloc/phone_auth_bloc_state.dart';


class PhoneAuthBloc extends Bloc<PhoneAuthEvent, PhoneAuthState> {
  final SubmitPhoneNumber submitPhoneNumber;

  PhoneAuthBloc({required this.submitPhoneNumber}) : super(PhoneAuthInitial()) {
    on<PhoneNumberSubmitted>(_onPhoneNumberSubmitted);
  }

  Future<void> _onPhoneNumberSubmitted(
    PhoneNumberSubmitted event,
    Emitter<PhoneAuthState> emit,
  ) async {
    emit(PhoneAuthLoading());
    final result = await submitPhoneNumber(event.phoneNumber);
    result.fold((failure) {
      String errorMessage = 'An unexpected error occurred';
      if (failure is ServerFailure) {
        // We could map specific server error messages here
        errorMessage = 'Server is currently unavailable.';
      } else if (failure is NetworkFailure) {
        errorMessage = 'No internet connection.';
      }
      emit(PhoneAuthError(errorMessage));
    }, (_) => emit(PhoneAuthSuccess()));
  }
  void _onPhoneNumberVerified(
    PhoneNumberVerified event,
    Emitter<PhoneAuthState> emit,
  ) {
   
    emit(VerificationSuccess());
  }
}
