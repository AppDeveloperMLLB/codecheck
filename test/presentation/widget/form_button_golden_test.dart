import 'package:codecheck/presentation/app_theme.dart';
import 'package:codecheck/presentation/widget/form_button.dart';
import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens('FormButton', (tester) async {
    final builder = DeviceBuilder()
      ..addScenario(
        widget: _create(
          text: 'test',
          enabled: true,
        ),
        name: 'enabled_short_text',
      )
      ..addScenario(
        widget: _create(
          text: "fajifjaohgoahiofehiahfafdaffjaiofejiafaafd",
          enabled: true,
        ),
        name: 'enabled_long_text',
      )
      ..addScenario(
        widget: _create(
          text: 'test',
          enabled: false,
        ),
        name: 'disabled_short_text',
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'form_button');
  });
}

Widget _create({
  required String text,
  required bool enabled,
}) {
  return MaterialApp(
    theme: appTheme,
    home: Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          child: FormButton(
            text: text,
            onPressed: enabled ? () {} : null,
          ),
        ),
      ),
    ),
  );
}
