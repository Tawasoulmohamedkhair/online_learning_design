import 'package:fpdart/fpdart.dart';
import 'package:online_learning_design/core/error/failures.dart';
import 'package:online_learning_design/core/usecase/usecase.dart';

import '../repositories/phone_auth_repository.dart';

class SubmitPhoneNumber implements UseCase<String, String> {
  final PhoneAuthRepository repository;

  SubmitPhoneNumber(this.repository);

  @override
  Future<Either<Failure, String>> call(String phoneNumber) async {
    return await repository.submitPhoneNumber(phoneNumber);
  }
}
