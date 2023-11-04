import 'package:codecheck/presentation/app_strings.dart';

class SearchTextValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.inputErrorMessageInSearchText;
    }

    return null;
  }
}
