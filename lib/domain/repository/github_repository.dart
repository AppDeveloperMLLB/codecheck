import "package:codecheck/domain/entity/github_repository_data.dart";

abstract class GithubRepository {
  Future<List<GithubRepositoryData>> fetchRepositories({
    required String searchWord,
  });
}
