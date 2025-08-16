import 'package:fpdart/fpdart.dart';
import 'package:online_learning_design/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
