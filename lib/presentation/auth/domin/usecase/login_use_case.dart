import 'package:online_learning_design/presentation/auth/data/repositry/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<void> call(String email, String password) async {
    await authRepository.login(email, password);
  }
}
