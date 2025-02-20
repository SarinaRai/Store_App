class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_message, $_prefix';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
    : super(message, 'Error During Communication');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Invalid Request');
}

class UnathorizedException extends AppException {
  UnathorizedException([String? message])
    : super(message, 'Unauthorized Request');
}

class BadGatewayException extends AppException {
  BadGatewayException([String? message])
    : super(message, 'Bad Gateway Request');
}

class NotFoundException extends AppException {
  NotFoundException([String? message]) : super(message, "404 not found");
}
