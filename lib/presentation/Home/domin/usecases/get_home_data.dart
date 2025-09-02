// lib/features/home/domain/usecases/get_home_data.dart
import 'package:fpdart/fpdart.dart';
import 'package:online_learning_design/core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/home_repository.dart';

class GetHomeData implements UseCase<Map<String, dynamic>, NoParams> {
  final HomeRepository repository;

  GetHomeData(this.repository);

  @override
  Future<Either<Failure, Map<String, dynamic>>> call(NoParams params) async {
    return await repository.getHomeData();
  }
}
