import 'package:fpdart/fpdart.dart';
import 'package:online_learning_design/core/error/failures.dart';

abstract class PhoneAuthRepository {
  Future<Either<Failure, void>> submitPhoneNumber(String phoneNumber);
}
