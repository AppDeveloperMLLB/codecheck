import "package:freezed_annotation/freezed_annotation.dart";
import "package:flutter/foundation.dart";
part "search_repositories_request.freezed.dart";
part "search_repositories_request.g.dart";

@freezed
class SearchRepositoriesRequest with _$SearchRepositoriesRequest {
  const SearchRepositoriesRequest._();
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SearchRepositoriesRequest({
    required String q,
    String? sort,
    String? order,
    int? perPage,
    int? page,
  }) = _SearchRepositoriesRequest;
  factory SearchRepositoriesRequest.fromJson(Map<String, Object?> json) =>
      _$SearchRepositoriesRequestFromJson(json);
}
