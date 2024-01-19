// GENERATED CODE - DO NOT MODIFY BY HAND

part of "search_repositories_request.dart";

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchRepositoriesRequestImpl _$$SearchRepositoriesRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchRepositoriesRequestImpl(
      q: json["q"] as String,
      sort: json["sort"] as String?,
      order: json["order"] as String?,
      perPage: json["per_page"] as int?,
      page: json["page"] as int?,
    );

Map<String, dynamic> _$$SearchRepositoriesRequestImplToJson(
        _$SearchRepositoriesRequestImpl instance) =>
    <String, dynamic>{
      "q": instance.q,
      "sort": instance.sort,
      "order": instance.order,
      "per_page": instance.perPage,
      "page": instance.page,
    };
