import 'package:codecheck/domain/entity/owner.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'github_repository_data.freezed.dart';
part 'github_repository_data.g.dart';

@freezed
class GithubRepositoryData with _$GithubRepositoryData {
  const GithubRepositoryData._();
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory GithubRepositoryData({
    required int id,
    required String fullName,
    Owner? owner,
    String? language,
    required int stargazersCount,
    required int watchersCount,
    required int forksCount,
    required int openIssuesCount,
  }) = _GithubRepositoryData;
  factory GithubRepositoryData.fromJson(Map<String, Object?> json) =>
      _$GithubRepositoryDataFromJson(json);
}
