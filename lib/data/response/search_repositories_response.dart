import "package:codecheck/domain/entity/owner.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "search_repositories_response.freezed.dart";
part "search_repositories_response.g.dart";

@freezed
class SearchRepositoriesResponse with _$SearchRepositoriesResponse {
  const SearchRepositoriesResponse._();
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SearchRepositoriesResponse({
    required int id,
    required String fullName,
    required int stargazersCount,
    required int forksCount,
    required int openIssuesCount,
    required String url,
    Owner? owner,
    String? language,
  }) = _SearchRepositoriesResponse;
  factory SearchRepositoriesResponse.fromJson(Map<String, Object?> json) =>
      _$SearchRepositoriesResponseFromJson(json);
}
