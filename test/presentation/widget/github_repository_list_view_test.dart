import "package:codecheck/core/exception/client_exception.dart";
import "package:codecheck/core/exception/service_unavailable_exception.dart";
import "package:codecheck/core/exception/unexpected_exception.dart";
import "package:codecheck/data/status_code.dart";
import "package:codecheck/domain/entity/github_repository_data.dart";
import "package:codecheck/presentation/app_strings.dart";
import "package:codecheck/presentation/app_theme.dart";
import "package:codecheck/presentation/provider/github_repositories_provider.dart";
import "package:codecheck/presentation/widget/github_repository_list_view.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

void main() {
  testWidgets(
      "should show repository not found message when repository is nothing.",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      _create(
        override: githubRepositoriesProvider.overrideWith(
          (ref, id) => [],
        ),
      ),
    );

    expect(
      find.text(AppStrings.repositoryNotFoundMessage),
      findsOneWidget,
    );
  });

  testWidgets("should show repository name when repository is found.",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      _create(
        override: githubRepositoriesProvider.overrideWith(
          (ref, id) => [
            const GithubRepositoryData(
              id: 1,
              fullName: "test",
              stargazersCount: 0,
              watchersCount: 0,
              forksCount: 0,
              openIssuesCount: 0,
            ),
          ],
        ),
      ),
    );

    expect(
      find.text("test"),
      findsOneWidget,
    );
  });

  testWidgets(
    "should show network error message when ClientException occurred.",
    (WidgetTester tester) async {
      await tester.pumpWidget(
        _create(
          override: githubRepositoriesProvider.overrideWith(
            (ref, id) => [
              throw ClientException("client exception"),
            ],
          ),
        ),
      );

      expect(
        find.text(AppStrings.networkErrorMessage),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    "should show service unavailable error message when ServiceUnavailableException occurred.",
    (WidgetTester tester) async {
      await tester.pumpWidget(
        _create(
          override: githubRepositoriesProvider.overrideWith(
            (ref, id) => throw ServiceUnavailableException(
              "message",
              StatusCode.serviceUnavailable,
            ),
          ),
        ),
      );

      expect(
        find.text(AppStrings.serviceUnavailableErrorMessage),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    "should show unexpected error message when UnexpectedException occurred.",
    (WidgetTester tester) async {
      final unexpectedException = UnexpectedException(
        "message",
        500,
      );
      await tester.pumpWidget(
        _create(
          override: githubRepositoriesProvider.overrideWith(
            (ref, id) => throw unexpectedException,
          ),
        ),
      );

      expect(
        find.text("""
        ${AppStrings.unexpectedErrorMessage}
        ${unexpectedException.toString()}
      """),
        findsOneWidget,
      );
    },
  );
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
