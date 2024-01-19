import "package:codecheck/presentation/app_theme.dart";
import "package:codecheck/presentation/widget/repository_details_title.dart";
import "package:flutter/material.dart";
import "package:golden_toolkit/golden_toolkit.dart";

void main() {
  testGoldens("RepositoryDetailsTitle", (tester) async {
    final builder = DeviceBuilder()
      ..addScenario(
        widget: _create(
          fullName: "test",
        ),
        name: "short_name",
      )
      ..addScenario(
        widget: _create(
          fullName:
              "fafjfaicjfjaifidoahfeoiandjvnlsafhehfaihfldcjfhioahfioahefoifd",
        ),
        name: "long_name",
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, "repository_details_title");
  });
}

Widget _create({
  required String fullName,
}) {
  return MaterialApp(
    theme: appTheme,
    home: Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          child: RepositoryDetailsTitle(
            fullName: fullName,
            // 値を渡すと、Image.networkで通信が発生するため、nullを渡す
            avatarUrl: null,
          ),
        ),
      ),
    ),
  );
}
