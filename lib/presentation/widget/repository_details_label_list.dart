import 'package:codecheck/presentation/app_strings.dart';
import 'package:codecheck/presentation/widget/repository_details_view_text.dart';
import 'package:flutter/material.dart';

class RepositoryDetailsLabelList extends StatelessWidget {
  const RepositoryDetailsLabelList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RepositoryDetailsViewText(
          AppStrings.language,
        ),
        RepositoryDetailsViewText(
          AppStrings.stargazersCount,
        ),
        RepositoryDetailsViewText(
          AppStrings.watchersCount,
        ),
        RepositoryDetailsViewText(
          AppStrings.forksCount,
        ),
        RepositoryDetailsViewText(
          AppStrings.issuesCount,
        ),
      ],
    );
  }
}
