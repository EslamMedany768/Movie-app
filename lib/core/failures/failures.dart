abstract class Failures {
  String error;

  Failures({required this.error});
}
class ServerError extends Failures{
  ServerError({required super.error});
}
class NetworkError extends Failures{
  NetworkError({required super.error});
}
