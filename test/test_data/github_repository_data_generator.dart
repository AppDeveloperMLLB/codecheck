import 'package:codecheck/domain/entity/github_repository_data.dart';

class GithubRepositoryDataGenerator {
  static List<GithubRepositoryData> generate({required int length}) {
    return List.generate(
      length,
      (index) {
        return GithubRepositoryData(
          id: index,
          fullName: "test$index",
          stargazersCount: index,
          watchersCount: index,
          forksCount: index,
          openIssuesCount: index,
        );
      },
    );
  }
}
