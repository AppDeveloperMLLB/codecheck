import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_repository_response.freezed.dart';
part 'get_repository_response.g.dart';

@freezed
class GetRepositoryResponse with _$GetRepositoryResponse {
  const GetRepositoryResponse._();
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory GetRepositoryResponse({
    required int subscribersCount,
  }) = _GetRepositoryResponse;
  factory GetRepositoryResponse.fromJson(Map<String, Object?> json) =>
      _$GetRepositoryResponseFromJson(json);
}
