import 'package:codecheck/domain/entity/github_repository_data.dart';
import 'package:codecheck/presentation/app_strings.dart';
import 'package:codecheck/presentation/widget/repository_details_title.dart';
import 'package:codecheck/presentation/widget/repository_details_view.dart';
import 'package:flutter/material.dart';

class RepositoryDetailsPage extends StatelessWidget {
  const RepositoryDetailsPage({
    super.key,
    required this.repositoryData,
  });

  final GithubRepositoryData repositoryData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.repositoryDetailsPageTitle,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(
              16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RepositoryDetailsTitle(
                  fullName: repositoryData.fullName,
                  avatarUrl: repositoryData.owner?.avatarUrl,
                ),
                const SizedBox(
                  height: 16,
                ),
                RepositoryDetailsView(
                  repositoryData: repositoryData,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
