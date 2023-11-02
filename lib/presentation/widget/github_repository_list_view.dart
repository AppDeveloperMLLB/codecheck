import 'package:codecheck/presentation/provider/github_repositories_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GithubRepositoryListView extends HookConsumerWidget {
  final String searchWord;
  const GithubRepositoryListView({
    super.key,
    required this.searchWord,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repositories = ref.watch(
      githubRepositoriesProvider(searchWord),
    );
    if (repositories.isLoading) {
      return const CircularProgressIndicator();
    }

    if (repositories.hasError) {
      return Text(repositories.error.toString());
    }

    return ListView.separated(
      itemCount: repositories.value?.length ?? 0,
      itemBuilder: (context, index) {
        final repository = repositories.value![index];
        return ListTile(
          title: Text(
            repository.fullName,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 16,
          child: Divider(
            height: 2,
            color: Colors.black,
          ),
        );
      },
    );
  }
}
