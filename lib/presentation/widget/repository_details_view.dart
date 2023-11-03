import 'package:codecheck/domain/entity/github_repository_data.dart';
import 'package:codecheck/presentation/widget/repository_details_content_list.dart';
import 'package:codecheck/presentation/widget/repository_details_label_list.dart';
import 'package:flutter/material.dart';

class RepositoryDetailsView extends StatelessWidget {
  const RepositoryDetailsView({
    super.key,
    required this.repositoryData,
  });
  final GithubRepositoryData repositoryData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const RepositoryDetailsLabelList(),
        const SizedBox(
          width: 16,
        ),
        Flexible(
          child: RepositoryDetailsContentList(
            repositoryData: repositoryData,
          ),
        )
      ],
    );
  }
}
