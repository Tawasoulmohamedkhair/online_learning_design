import 'package:fpdart/fpdart.dart';
import 'package:online_learning_design/core/error/failures.dart';

import '../entites/user.dart';

abstract   interface class AuthRepository {
  Future<Either<Failure,User>> loginWithEmailPassword({required String email, required String password});
  Future<Either<Failure,User>> signUpWithEmailPassword({required String name,required String email, required String password});
}