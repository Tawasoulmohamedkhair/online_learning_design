import 'package:fpdart/fpdart.dart';
import 'package:online_learning_design/core/error/failures.dart';

abstract class PhoneAuthRepository {
  Future<Either<Failure, String>> submitPhoneNumber(String phoneNumber);

  Future<Either<Failure, void>> verifyOtp(
    String verificationId,
    String otpCode,
  );
}
