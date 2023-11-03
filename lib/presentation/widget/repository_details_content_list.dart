import 'package:codecheck/domain/entity/github_repository_data.dart';
import 'package:codecheck/presentation/widget/repository_details_view_text.dart';
import 'package:flutter/material.dart';

class RepositoryDetailsContentList extends StatelessWidget {
  const RepositoryDetailsContentList({
    super.key,
    required this.repositoryData,
  });
  final GithubRepositoryData repositoryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RepositoryDetailsViewText(
          repositoryData.language ?? "-",
        ),
        RepositoryDetailsViewText(
          repositoryData.stargazersCount.toString(),
        ),
        RepositoryDetailsViewText(
          repositoryData.watchersCount.toString(),
        ),
        RepositoryDetailsViewText(
          repositoryData.forksCount.toString(),
        ),
        RepositoryDetailsViewText(
          repositoryData.openIssuesCount.toString(),
        ),
      ],
    );
  }
}
