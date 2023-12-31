import 'package:codecheck/core/router/app_route.dart';
import 'package:codecheck/presentation/app_strings.dart';
import 'package:codecheck/presentation/exception_message.dart';
import 'package:codecheck/presentation/provider/github_repositories_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (repositories.hasError) {
      return Center(
        child: Text(
          ExceptionMessage.get(repositories.error),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
        ),
      );
    }

    if (repositories.value == null || repositories.value!.isEmpty) {
      return Center(
        child: Text(
          AppStrings.repositoryNotFoundMessage,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      );
    }

    return ListView.separated(
      itemCount: repositories.value!.length,
      itemBuilder: (context, index) {
        final repository = repositories.value![index];
        return ListTile(
          onTap: () {
            context.go(
              AppRoute.repositoryDetails.fullPath,
              extra: repository,
            );
          },
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
