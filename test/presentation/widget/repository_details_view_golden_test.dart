import 'package:codecheck/domain/entity/github_repository_data.dart';
import 'package:codecheck/presentation/app_theme.dart';
import 'package:codecheck/presentation/widget/repository_details_view.dart';
import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens('RepositoryDetailsView', (tester) async {
    const testData = GithubRepositoryData(
      id: 1,
      fullName: "test1",
      language: "Dart",
      stargazersCount: 1,
      watchersCount: 2,
      forksCount: 3,
      openIssuesCount: 4,
    );
    final builder = DeviceBuilder()
      ..addScenario(
        widget: _create(
          repositoryData: testData,
        ),
        name: 'language_is_not_null',
      )
      ..addScenario(
        widget: _create(
          repositoryData: testData.copyWith(
            language: null,
          ),
        ),
        name: 'language_is_not_null',
      )
      ..addScenario(
        widget: _create(
          repositoryData: testData.copyWith(
            language: "afafafafdjiehafhfisahfoiehao",
            stargazersCount: 10000000000000,
            watchersCount: 200000000000000000,
            forksCount: 3000000000000,
            openIssuesCount: 40000000000000,
          ),
        ),
        name: 'long_text',
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'repository_details_view');
  });
}

Widget _create({
  required GithubRepositoryData repositoryData,
}) {
  return MaterialApp(
    theme: appTheme,
    home: Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          child: RepositoryDetailsView(
            repositoryData: repositoryData,
          ),
        ),
      ),
    ),
  );
}
