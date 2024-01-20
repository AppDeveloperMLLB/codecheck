import "package:codecheck/data/repository/repository_provider.dart";
import "package:codecheck/domain/entity/github_repository_data.dart";
import "package:codecheck/domain/repository/github_repository.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

final searchRepositoryUseCaseProvider = Provider(
  (ref) => SearchRepositoryUseCase(
    ref.read(githubRepositoryProvider),
  ),
);

class SearchRepositoryUseCase {
  final GithubRepository _repository;

  SearchRepositoryUseCase(this._repository);

  Future<List<GithubRepositoryData>> fetchRepositories({
    required String searchWord,
  }) async {
    return await _repository.fetchRepositories(
      searchWord: searchWord,
    );
  }
}
