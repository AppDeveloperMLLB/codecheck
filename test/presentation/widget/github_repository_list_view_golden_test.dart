import "package:codecheck/core/exception/client_exception.dart";
import "package:codecheck/core/exception/service_unavailable_exception.dart";
import "package:codecheck/core/exception/unexpected_exception.dart";
import "package:codecheck/data/status_code.dart";
import "package:codecheck/presentation/app_theme.dart";
import "package:codecheck/presentation/provider/github_repositories_provider.dart";
import "package:codecheck/presentation/widget/github_repository_list_view.dart";
import "package:flutter/material.dart";
import "package:golden_toolkit/golden_toolkit.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../../test_data/github_repository_data_generator.dart";

void main() {
  testGoldens("GithubRepositoryListView", (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.iphone11,
        Device.tabletPortrait,
      ])
      ..addScenario(
        widget: _create(
          override: githubRepositoriesProvider.overrideWith((ref, id) => []),
        ),
        name: "empty",
      )
      ..addScenario(
        widget: _create(
          override: githubRepositoriesProvider.overrideWith(
            (ref, id) => GithubRepositoryDataGenerator.generate(length: 3),
          ),
        ),
        name: "not_needs_scroll",
      )
      ..addScenario(
        widget: _create(
          override: githubRepositoriesProvider.overrideWith(
            (ref, id) => GithubRepositoryDataGenerator.generate(length: 30),
          ),
        ),
        name: "needs_scroll",
      )
      ..addScenario(
        widget: _create(
          override: githubRepositoriesProvider.overrideWith(
            (ref, id) => throw ClientException("client exception"),
          ),
        ),
        name: "client_exception",
      )
      ..addScenario(
        widget: _create(
          override: githubRepositoriesProvider.overrideWith(
            (ref, id) => throw ServiceUnavailableException(
              "service unavailable exception",
              StatusCode.serviceUnavailable,
            ),
          ),
        ),
        name: "service_unavailable_exception",
      )
      ..addScenario(
        widget: _create(
          override: githubRepositoriesProvider.overrideWith(
            (ref, id) => throw UnexpectedException("unexpected exception", 422),
          ),
        ),
        name: "unexpected_exception",
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, "github_repository_list_view");
  });
}

Widget _create({
  required Override override,
}) {
  return MaterialApp(
    theme: appTheme,
    home: Scaffold(
      body: Center(
        child: ProviderScope(
          overrides: [
            override,
          ],
          child: const GithubRepositoryListView(
            searchWord: "test",
          ),
        ),
      ),
    ),
  );
}
