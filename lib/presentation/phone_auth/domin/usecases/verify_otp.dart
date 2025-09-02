// In domain/usecases/verify_otp.dart
import 'package:fpdart/fpdart.dart';
import 'package:online_learning_design/core/error/failures.dart';

import '../../../../core/usecase/usecase.dart';
import '../repositories/phone_auth_repository.dart';

class VerifyOtp implements UseCase<void, Map<String, String>> {
  final PhoneAuthRepository repository;

  VerifyOtp(this.repository);

  @override
  Future<Either<Failure, void>> call(Map<String, String> params) async {
    final phoneNumber = params['phoneNumber']!;
    final otpCode = params['otpCode']!;

    return await repository.verifyOtp(phoneNumber, otpCode);
  }
}
