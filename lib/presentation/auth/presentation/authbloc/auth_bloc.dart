import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_learning_design/presentation/auth/domin/usecase/login_use_case.dart';
import 'package:online_learning_design/presentation/auth/domin/usecase/sign_up_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool _agreedToTerms = false;

  AuthBloc({
    required SignUpUseCase signUpUseCase,
    required LoginUseCase loginUseCase,
  }) : super(AuthInitial()) {
    on<SignUpRequested>(_onSignUpRequested);
    on<LoginRequested>(_onLoginRequested);
    on<TermsToggled>(_onTermsToggled);
  }

  // Sign-Up using Firebase
  void _onSignUpRequested(
    SignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    if (!_agreedToTerms) {
      emit(const AuthFailure(error: 'Please agree to the terms.'));
      return;
    }
    emit(AuthLoading());
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'weak-password') {
        errorMessage = 'Password is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'This email is already registered.';
      } else {
        errorMessage = e.message ?? 'Sign up failed';
      }
      emit(AuthFailure(error: errorMessage));
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }

  // Login using Firebase
  void _onLoginRequested(LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(AuthSuccess()); // only if correct
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for this email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'The password is incorrect.';
      } else {
        errorMessage = e.message ?? 'Login failed';
      }
      emit(AuthFailure(error: errorMessage));
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }

  // Toggle Terms
  void _onTermsToggled(TermsToggled event, Emitter<AuthState> emit) {
    _agreedToTerms = !_agreedToTerms;
    emit(AuthTermsState(agreedToTerms: _agreedToTerms));
  }
}
