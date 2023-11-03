import 'dart:convert';
import 'package:codecheck/core/exception/service_unavailable_exception.dart';
import 'package:codecheck/core/exception/unexpected_exception.dart';
import 'package:codecheck/core/exception/client_exception.dart';
import 'package:codecheck/data/request/search_repositories_request.dart';
import 'package:codecheck/data/response/get_repository_response.dart';
import 'package:codecheck/data/response/search_repositories_response.dart';
import 'package:codecheck/data/status_code.dart';
import 'package:codecheck/domain/entity/github_repository_data.dart';
import 'package:codecheck/domain/repository/github_repository.dart';
import 'package:http/http.dart' as http;

class APIGithubRepository implements GithubRepository {
  final headers = {
    'Accept': 'application/vnd.github+json',
  };

  @override
  Future<List<GithubRepositoryData>> fetchRepositories({
    required String searchWord,
  }) async {
    // 検索ワードでリポジトリを検索
    final searchedRepositories =
        await _searchRepositories(searchWord: searchWord);

    // 検索したリポジトリごとに、watchersCountを取得して、リポジトリデータを作成
    // リポジトリ検索で取得したwatchersCountは正しくないので、
    // リポジトリのデータを取得する必要がある
    var futures = <Future<GithubRepositoryData>>[];
    for (var searchedRepository in searchedRepositories) {
      futures.add(
        _getRepositoryWatchersCount(url: searchedRepository.url).then(
          (watchersCount) => GithubRepositoryData(
            id: searchedRepository.id,
            fullName: searchedRepository.fullName,
            language: searchedRepository.language,
            owner: searchedRepository.owner,
            stargazersCount: searchedRepository.stargazersCount,
            watchersCount: watchersCount,
            forksCount: searchedRepository.forksCount,
            openIssuesCount: searchedRepository.openIssuesCount,
          ),
        ),
      );
    }

    return await Future.wait(futures);
  }

  Future<List<SearchRepositoriesResponse>> _searchRepositories({
    required String searchWord,
  }) async {
    // クエリパラメータを作成
    final request = SearchRepositoriesRequest(
      q: searchWord,
    );

    // URLを作成
    var url = Uri.https(
      'api.github.com',
      'search/repositories',
      request.toJson(),
    );

    http.Response response;
    try {
      // APIを実行
      response = await http.get(
        url,
        headers: headers,
      );
    } catch (e) {
      throw ClientException(e.toString());
    }

    if (response.statusCode == StatusCode.ok) {
      List<SearchRepositoriesResponse> list = [];
      try {
        Map<String, dynamic> decoded = json.decode(response.body);
        decoded['items'].forEach((item) {
          list.add(SearchRepositoriesResponse.fromJson(item));
        });

        return list;
      } catch (e) {
        rethrow;
      }
    }

    if (response.statusCode == StatusCode.serviceUnvalilable) {
      throw ServiceUnavailableException(
        response.body,
        response.statusCode,
      );
    }

    throw UnexpectedException(
      response.body,
      response.statusCode,
    );
  }

  Future<int> _getRepositoryWatchersCount({
    required String url,
  }) async {
    // URLを作成
    final uri = Uri.parse(url);
    final response = await http.get(
      uri,
      headers: headers,
    );

    if (response.statusCode == StatusCode.ok) {
      Map<String, dynamic> decoded = json.decode(response.body);
      return GetRepositoryResponse.fromJson(decoded).subscribersCount;
    }
    // 200, 503以外は基本的には来ないはずなので、UnexpectedExceptionとして扱う
    throw UnexpectedException(
      response.body,
      response.statusCode,
    );
  }
}
