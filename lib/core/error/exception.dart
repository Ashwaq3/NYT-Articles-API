class ServerException implements Exception {
  final String message;
  final int statusCode;
  const ServerException(this.message, [this.statusCode = 404]);
}

class NetworkException extends ServerException {
  const NetworkException(String message, [int statusCode = 511])
      : super(message, statusCode);
}

class BadRequestException extends ServerException {
  const BadRequestException(String message, [int statusCode = 400])
      : super(message, statusCode);
}

class UnauthorisedException extends ServerException {
  const UnauthorisedException(String message, [int statusCode = 401])
      : super(message, statusCode);
}

class TooManyRequestException extends ServerException {
  const TooManyRequestException(String message, [int statusCode = 429])
      : super(message, statusCode);
}

class BadResponseException extends ServerException {
  const BadResponseException(String message, [int statusCode = 429])
      : super(message, statusCode);
}

class FetchDataException extends ServerException {
  const FetchDataException(String message, [int statusCode = 666])
      : super(message, statusCode);
}