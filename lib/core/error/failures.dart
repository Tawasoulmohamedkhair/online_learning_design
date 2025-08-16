class Failure {}

class ServerFailure extends Failure {
  final String message;
  ServerFailure({this.message = 'Server Error'});
}

class NetworkFailure extends Failure {}
