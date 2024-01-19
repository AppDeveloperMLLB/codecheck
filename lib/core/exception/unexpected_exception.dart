class UnexpectedException implements Exception {
  final String message;
  final int statusCode;

  UnexpectedException(this.message, this.statusCode);

  @override
  String toString() {
    return "UnexpectedException{message: $message, statusCode: $statusCode}";
  }
}
