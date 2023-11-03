class ServiceUnavailableException implements Exception {
  final String message;
  final int statusCode;

  ServiceUnavailableException(
    this.message,
    this.statusCode,
  );

  @override
  String toString() {
    return 'ServiceUnavailableException{message: $message, statusCode: $statusCode}';
  }
}
