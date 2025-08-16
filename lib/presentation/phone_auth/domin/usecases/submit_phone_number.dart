
import 'package:fpdart/fpdart.dart';
import 'package:online_learning_design/core/error/failures.dart';
import 'package:online_learning_design/core/usecase/usecase.dart';

import '../repositories/phone_auth_repository.dart';

class SubmitPhoneNumber implements UseCase<void, String> {
  final PhoneAuthRepository repository;

  SubmitPhoneNumber(this.repository);

  @override
  Future<Either<Failure, void>> call(String phoneNumber) async {
    return await repository.submitPhoneNumber(phoneNumber);
  }
}
