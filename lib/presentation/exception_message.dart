import 'package:codecheck/core/exception/service_unavailable_exception.dart';
import 'package:codecheck/core/exception/unexpected_exception.dart';
import 'package:codecheck/core/exception/client_exception.dart';
import 'package:codecheck/presentation/app_strings.dart';

class ExceptionMessage {
  static String get(Object? exception) {
    if (exception is ClientException) {
      return AppStrings.networkErrorMessage;
    } else if (exception is ServiceUnavailableException) {
      return AppStrings.serviceUnavailableErrorMessage;
    } else if (exception is UnexpectedException) {
      return """
        ${AppStrings.unexpectedErrorMessage}
        ${exception.toString()}
      """;
    } else {
      return exception.toString();
    }
  }
}
