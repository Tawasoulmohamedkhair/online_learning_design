import 'package:online_learning_design/presentation/auth/data/repositry/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository authRepository;

  SignUpUseCase({required this.authRepository});

  Future<void> call(String email, String password) async {
    await authRepository.signUp(email, password);
  }
}
