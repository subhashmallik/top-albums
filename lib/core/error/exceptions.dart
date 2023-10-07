class ServerException implements Exception {
  String message;
  ServerException(this.message);
}

class ServiceException implements Exception {}

class APIException implements Exception {
  final int code;
  APIException(this.code);
}
