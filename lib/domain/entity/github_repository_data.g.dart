// GENERATED CODE - DO NOT MODIFY BY HAND

part of "github_repository_data.dart";

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GithubRepositoryDataImpl _$$GithubRepositoryDataImplFromJson(
        Map<String, dynamic> json) =>
    _$GithubRepositoryDataImpl(
      id: json["id"] as int,
      fullName: json["full_name"] as String,
      owner: json["owner"] == null
          ? null
          : Owner.fromJson(json["owner"] as Map<String, dynamic>),
      language: json["language"] as String?,
      stargazersCount: json["stargazers_count"] as int,
      watchersCount: json["watchers_count"] as int,
      forksCount: json["forks_count"] as int,
      openIssuesCount: json["open_issues_count"] as int,
    );

Map<String, dynamic> _$$GithubRepositoryDataImplToJson(
        _$GithubRepositoryDataImpl instance) =>
    <String, dynamic>{
      "id": instance.id,
      "full_name": instance.fullName,
      "owner": instance.owner,
      "language": instance.language,
      "stargazers_count": instance.stargazersCount,
      "watchers_count": instance.watchersCount,
      "forks_count": instance.forksCount,
      "open_issues_count": instance.openIssuesCount,
    };
