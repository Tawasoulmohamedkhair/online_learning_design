import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_design/presentation/auth/authbloc/auth_event.dart';
import 'package:online_learning_design/presentation/auth/authbloc/auth_state.dart';
import 'package:online_learning_design/presentation/auth/domin/usecase/login_use_case.dart';
import 'package:online_learning_design/presentation/auth/domin/usecase/sign_up_usecase.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUseCase signUpUseCase;
  final LoginUseCase loginUseCase;
  bool _agreedToTerms = false;

  AuthBloc({required this.signUpUseCase, required this.loginUseCase})
    : super(AuthInitial()) {
    on<SignUpRequested>(_onSignUpRequested);
    on<LoginRequested>(_onLoginRequested);
    on<TermsToggled>(_onTermsToggled);
  }

  void _onSignUpRequested(
    SignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    if (!_agreedToTerms) {
      emit(
        const AuthFailure(error: 'Please agree to the terms and conditions.'),
      );
      return;
    }
    emit(AuthLoading());
    try {
      await signUpUseCase.call(event.email, event.password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }

  void _onLoginRequested(LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await loginUseCase.call(event.email, event.password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }

  void _onTermsToggled(TermsToggled event, Emitter<AuthState> emit) {
    _agreedToTerms = !_agreedToTerms;
    emit(AuthTermsState(agreedToTerms: _agreedToTerms));
  }
}
