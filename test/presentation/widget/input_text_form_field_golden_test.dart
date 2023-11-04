import 'package:codecheck/presentation/app_theme.dart';
import 'package:codecheck/presentation/validator/search_text_validator.dart';
import 'package:codecheck/presentation/widget/input_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens('InputTextFormField', (tester) async {
    final TextEditingController controller = TextEditingController();
    final TextEditingController initialController = TextEditingController();
    const label = "InputTextFormField";
    final builder = DeviceBuilder()
      ..addScenario(
        widget: _create(
          controller: initialController,
          label: label,
        ),
        name: 'initial',
      )
      ..addScenario(
        widget: _create(
          controller: controller,
          label: label,
        ),
        onCreate: (scenarioWidgetKey) async {
          await _inputText(
            key: scenarioWidgetKey,
            tester: tester,
            label: label,
            text: 'test',
          );
        },
        name: 'input_text',
      )
      ..addScenario(
        widget: Form(
          // validateしてエラー表示にするために設定
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: _create(
            controller: initialController,
            label: label,
          ),
        ),
        onCreate: (scenarioWidgetKey) async {
          // テキストを入力して、空白に戻すことでエラー表示にする
          await _inputText(
            key: scenarioWidgetKey,
            tester: tester,
            label: label,
            text: 'test',
          );
          await _inputText(
            key: scenarioWidgetKey,
            tester: tester,
            label: label,
            text: '',
          );
        },
        name: 'error',
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'input_text_form_field');
    controller.dispose();
    initialController.dispose();
  });
}

Widget _create({
  required TextEditingController controller,
  required String label,
}) {
  return MaterialApp(
    theme: appTheme,
    home: Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          child: InputTextFormField(
            controller: controller,
            label: label,
            validator: (text) {
              return SearchTextValidator.validate(text);
            },
          ),
        ),
      ),
    ),
  );
}

Future<void> _inputText({
  required Key key,
  required WidgetTester tester,
  required String label,
  required String text,
}) async {
  final textField = find.descendant(
    of: find.byKey(key),
    matching: find.widgetWithText(
      InputTextFormField,
      label,
    ),
  );
  await tester.enterText(
    textField,
    text,
  );
  // tabletだとこれをしないとフォーカスが当たったままになる
  FocusManager.instance.primaryFocus?.unfocus();
  await tester.pumpAndSettle();
}
