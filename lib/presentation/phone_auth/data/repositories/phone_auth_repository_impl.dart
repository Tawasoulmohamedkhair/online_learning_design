import 'package:fpdart/fpdart.dart';
import 'package:online_learning_design/core/error/exceptions.dart';
import 'package:online_learning_design/core/error/failures.dart';
import 'package:online_learning_design/core/utils/network_info.dart';
import 'package:online_learning_design/presentation/phone_auth/data/datasources/remote_data_source.dart';
import 'package:online_learning_design/presentation/phone_auth/domin/repositories/phone_auth_repository.dart';


class PhoneAuthRepositoryImpl implements PhoneAuthRepository {
  final PhoneAuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  PhoneAuthRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, void>> submitPhoneNumber(String phoneNumber) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.submitPhoneNumber(phoneNumber);
        return Right(null);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
