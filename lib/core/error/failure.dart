
abstract class Failure {
  List properties = const <dynamic>[];

  Failure([properties]);

}

// Genaral Failures
class ServerFailure extends Failure {}

class NetworkFailure extends Failure {}
