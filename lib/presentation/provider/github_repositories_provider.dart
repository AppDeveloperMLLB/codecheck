import 'package:codecheck/domain/entity/github_repository_data.dart';
import 'package:codecheck/usecase/search_repository_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final githubRepositoriesProvider =
    FutureProvider.family<List<GithubRepositoryData>, String>(
  (ref, searchWord) async {
    final useCase = ref.watch(searchRepositoryUseCaseProvider);
    return await useCase.fetchRepositories(searchWord: searchWord);
  },
);
