import 'package:fpdart/fpdart.dart';
import 'package:online_learning_design/core/error/failures.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
