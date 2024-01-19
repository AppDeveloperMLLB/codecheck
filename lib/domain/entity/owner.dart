import "package:freezed_annotation/freezed_annotation.dart";
import "package:flutter/foundation.dart";
part "owner.freezed.dart";
part "owner.g.dart";

@freezed
class Owner with _$Owner {
  const Owner._();
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Owner({
    required int id,
    required String avatarUrl,
  }) = _Owner;
  factory Owner.fromJson(Map<String, Object?> json) => _$OwnerFromJson(json);
}
