// GENERATED CODE - DO NOT MODIFY BY HAND

part of "search_repositories_response.dart";

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchRepositoriesResponseImpl _$$SearchRepositoriesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchRepositoriesResponseImpl(
      id: json["id"] as int,
      fullName: json["full_name"] as String,
      owner: json["owner"] == null
          ? null
          : Owner.fromJson(json["owner"] as Map<String, dynamic>),
      language: json["language"] as String?,
      stargazersCount: json["stargazers_count"] as int,
      forksCount: json["forks_count"] as int,
      openIssuesCount: json["open_issues_count"] as int,
      url: json["url"] as String,
    );

Map<String, dynamic> _$$SearchRepositoriesResponseImplToJson(
        _$SearchRepositoriesResponseImpl instance) =>
    <String, dynamic>{
      "id": instance.id,
      "full_name": instance.fullName,
      "owner": instance.owner,
      "language": instance.language,
      "stargazers_count": instance.stargazersCount,
      "forks_count": instance.forksCount,
      "open_issues_count": instance.openIssuesCount,
      "url": instance.url,
    };
