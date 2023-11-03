// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_repository_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetRepositoryResponse _$GetRepositoryResponseFromJson(
    Map<String, dynamic> json) {
  return _GetRepositoryResponse.fromJson(json);
}

/// @nodoc
mixin _$GetRepositoryResponse {
  int get subscribersCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetRepositoryResponseCopyWith<GetRepositoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetRepositoryResponseCopyWith<$Res> {
  factory $GetRepositoryResponseCopyWith(GetRepositoryResponse value,
          $Res Function(GetRepositoryResponse) then) =
      _$GetRepositoryResponseCopyWithImpl<$Res, GetRepositoryResponse>;
  @useResult
  $Res call({int subscribersCount});
}

/// @nodoc
class _$GetRepositoryResponseCopyWithImpl<$Res,
        $Val extends GetRepositoryResponse>
    implements $GetRepositoryResponseCopyWith<$Res> {
  _$GetRepositoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscribersCount = null,
  }) {
    return _then(_value.copyWith(
      subscribersCount: null == subscribersCount
          ? _value.subscribersCount
          : subscribersCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetRepositoryResponseImplCopyWith<$Res>
    implements $GetRepositoryResponseCopyWith<$Res> {
  factory _$$GetRepositoryResponseImplCopyWith(
          _$GetRepositoryResponseImpl value,
          $Res Function(_$GetRepositoryResponseImpl) then) =
      __$$GetRepositoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int subscribersCount});
}

/// @nodoc
class __$$GetRepositoryResponseImplCopyWithImpl<$Res>
    extends _$GetRepositoryResponseCopyWithImpl<$Res,
        _$GetRepositoryResponseImpl>
    implements _$$GetRepositoryResponseImplCopyWith<$Res> {
  __$$GetRepositoryResponseImplCopyWithImpl(_$GetRepositoryResponseImpl _value,
      $Res Function(_$GetRepositoryResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscribersCount = null,
  }) {
    return _then(_$GetRepositoryResponseImpl(
      subscribersCount: null == subscribersCount
          ? _value.subscribersCount
          : subscribersCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$GetRepositoryResponseImpl extends _GetRepositoryResponse {
  const _$GetRepositoryResponseImpl({required this.subscribersCount})
      : super._();

  factory _$GetRepositoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetRepositoryResponseImplFromJson(json);

  @override
  final int subscribersCount;

  @override
  String toString() {
    return 'GetRepositoryResponse(subscribersCount: $subscribersCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetRepositoryResponseImpl &&
            (identical(other.subscribersCount, subscribersCount) ||
                other.subscribersCount == subscribersCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, subscribersCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetRepositoryResponseImplCopyWith<_$GetRepositoryResponseImpl>
      get copyWith => __$$GetRepositoryResponseImplCopyWithImpl<
          _$GetRepositoryResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetRepositoryResponseImplToJson(
      this,
    );
  }
}

abstract class _GetRepositoryResponse extends GetRepositoryResponse {
  const factory _GetRepositoryResponse({required final int subscribersCount}) =
      _$GetRepositoryResponseImpl;
  const _GetRepositoryResponse._() : super._();

  factory _GetRepositoryResponse.fromJson(Map<String, dynamic> json) =
      _$GetRepositoryResponseImpl.fromJson;

  @override
  int get subscribersCount;
  @override
  @JsonKey(ignore: true)
  _$$GetRepositoryResponseImplCopyWith<_$GetRepositoryResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
