// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_repositories_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchRepositoriesRequest _$SearchRepositoriesRequestFromJson(
    Map<String, dynamic> json) {
  return _SearchRepositoriesRequest.fromJson(json);
}

/// @nodoc
mixin _$SearchRepositoriesRequest {
  String get q => throw _privateConstructorUsedError;
  String? get sort => throw _privateConstructorUsedError;
  String? get order => throw _privateConstructorUsedError;
  int? get perPage => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchRepositoriesRequestCopyWith<SearchRepositoriesRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchRepositoriesRequestCopyWith<$Res> {
  factory $SearchRepositoriesRequestCopyWith(SearchRepositoriesRequest value,
          $Res Function(SearchRepositoriesRequest) then) =
      _$SearchRepositoriesRequestCopyWithImpl<$Res, SearchRepositoriesRequest>;
  @useResult
  $Res call({String q, String? sort, String? order, int? perPage, int? page});
}

/// @nodoc
class _$SearchRepositoriesRequestCopyWithImpl<$Res,
        $Val extends SearchRepositoriesRequest>
    implements $SearchRepositoriesRequestCopyWith<$Res> {
  _$SearchRepositoriesRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? q = null,
    Object? sort = freezed,
    Object? order = freezed,
    Object? perPage = freezed,
    Object? page = freezed,
  }) {
    return _then(_value.copyWith(
      q: null == q
          ? _value.q
          : q // ignore: cast_nullable_to_non_nullable
              as String,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as String?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchRepositoriesRequestImplCopyWith<$Res>
    implements $SearchRepositoriesRequestCopyWith<$Res> {
  factory _$$SearchRepositoriesRequestImplCopyWith(
          _$SearchRepositoriesRequestImpl value,
          $Res Function(_$SearchRepositoriesRequestImpl) then) =
      __$$SearchRepositoriesRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String q, String? sort, String? order, int? perPage, int? page});
}

/// @nodoc
class __$$SearchRepositoriesRequestImplCopyWithImpl<$Res>
    extends _$SearchRepositoriesRequestCopyWithImpl<$Res,
        _$SearchRepositoriesRequestImpl>
    implements _$$SearchRepositoriesRequestImplCopyWith<$Res> {
  __$$SearchRepositoriesRequestImplCopyWithImpl(
      _$SearchRepositoriesRequestImpl _value,
      $Res Function(_$SearchRepositoriesRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? q = null,
    Object? sort = freezed,
    Object? order = freezed,
    Object? perPage = freezed,
    Object? page = freezed,
  }) {
    return _then(_$SearchRepositoriesRequestImpl(
      q: null == q
          ? _value.q
          : q // ignore: cast_nullable_to_non_nullable
              as String,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as String?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$SearchRepositoriesRequestImpl extends _SearchRepositoriesRequest
    with DiagnosticableTreeMixin {
  const _$SearchRepositoriesRequestImpl(
      {required this.q, this.sort, this.order, this.perPage, this.page})
      : super._();

  factory _$SearchRepositoriesRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchRepositoriesRequestImplFromJson(json);

  @override
  final String q;
  @override
  final String? sort;
  @override
  final String? order;
  @override
  final int? perPage;
  @override
  final int? page;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchRepositoriesRequest(q: $q, sort: $sort, order: $order, perPage: $perPage, page: $page)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchRepositoriesRequest'))
      ..add(DiagnosticsProperty('q', q))
      ..add(DiagnosticsProperty('sort', sort))
      ..add(DiagnosticsProperty('order', order))
      ..add(DiagnosticsProperty('perPage', perPage))
      ..add(DiagnosticsProperty('page', page));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchRepositoriesRequestImpl &&
            (identical(other.q, q) || other.q == q) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.page, page) || other.page == page));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, q, sort, order, perPage, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchRepositoriesRequestImplCopyWith<_$SearchRepositoriesRequestImpl>
      get copyWith => __$$SearchRepositoriesRequestImplCopyWithImpl<
          _$SearchRepositoriesRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchRepositoriesRequestImplToJson(
      this,
    );
  }
}

abstract class _SearchRepositoriesRequest extends SearchRepositoriesRequest {
  const factory _SearchRepositoriesRequest(
      {required final String q,
      final String? sort,
      final String? order,
      final int? perPage,
      final int? page}) = _$SearchRepositoriesRequestImpl;
  const _SearchRepositoriesRequest._() : super._();

  factory _SearchRepositoriesRequest.fromJson(Map<String, dynamic> json) =
      _$SearchRepositoriesRequestImpl.fromJson;

  @override
  String get q;
  @override
  String? get sort;
  @override
  String? get order;
  @override
  int? get perPage;
  @override
  int? get page;
  @override
  @JsonKey(ignore: true)
  _$$SearchRepositoriesRequestImplCopyWith<_$SearchRepositoriesRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
