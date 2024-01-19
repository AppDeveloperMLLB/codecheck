import "package:codecheck/domain/entity/github_repository_data.dart";
import "package:codecheck/presentation/app_strings.dart";
import "package:codecheck/presentation/widget/repository_details_view_text.dart";
import "package:flutter/material.dart";

class RepositoryDetailsView extends StatelessWidget {
  const RepositoryDetailsView({
    super.key,
    required this.repositoryData,
  });
  final GithubRepositoryData repositoryData;

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultColumnWidth: const IntrinsicColumnWidth(),
      columnWidths: const {
        0: IntrinsicColumnWidth(),
        1: FlexColumnWidth(),
      },
      children: [
        _createRow(
          AppStrings.language,
          repositoryData.language ?? "-",
        ),
        _createRow(
          AppStrings.stargazersCount,
          repositoryData.stargazersCount.toString(),
        ),
        _createRow(
          AppStrings.watchersCount,
          repositoryData.watchersCount.toString(),
        ),
        _createRow(
          AppStrings.forksCount,
          repositoryData.forksCount.toString(),
        ),
        _createRow(
          AppStrings.issuesCount,
          repositoryData.openIssuesCount.toString(),
        ),
      ],
    );
  }

  TableRow _createRow(
    String label,
    String value,
  ) {
    return TableRow(
      children: [
        RepositoryDetailsViewText(
          label,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: RepositoryDetailsViewText(
            value,
          ),
        ),
      ],
    );
  }
}
