import "package:codecheck/data/repository/api_github_repository.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

final githubRepositoryProvider = Provider(
  (_) => APIGithubRepository(),
);
