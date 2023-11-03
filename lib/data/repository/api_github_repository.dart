import 'dart:convert';
import 'package:codecheck/core/exception/service_unavailable_exception.dart';
import 'package:codecheck/core/exception/unexpected_exception.dart';
import 'package:codecheck/core/exception/client_exception.dart';
import 'package:codecheck/data/request/search_repositories_request.dart';
import 'package:codecheck/data/status_code.dart';
import 'package:codecheck/domain/entity/github_repository_data.dart';
import 'package:codecheck/domain/repository/github_repository.dart';
import 'package:http/http.dart' as http;

class APIGithubRepository implements GithubRepository {
  @override
  Future<List<GithubRepositoryData>> fetchRepositories({
    required String searchWord,
  }) async {
    final request = SearchRepositoriesRequest(
      q: searchWord,
    );
    var url = Uri.https(
      'api.github.com',
      'search/repositories',
      request.toJson(),
    );

    http.Response response;
    try {
      response = await http.get(
        url,
        headers: {
          'Accept': 'application/vnd.github+json',
        },
      );
    } catch (e) {
      throw ClientException(e.toString());
    }

    if (response.statusCode == StatusCode.ok) {
      List<GithubRepositoryData> list = [];
      try {
        Map<String, dynamic> decoded = json.decode(response.body);
        decoded['items'].forEach((item) {
          list.add(GithubRepositoryData.fromJson(item));
        });
      } catch (e) {
        rethrow;
      }

      return list;
    } else if (response.statusCode == StatusCode.serviceUnvalilable) {
      throw ServiceUnavailableException(
        response.body,
        response.statusCode,
      );
    } else {
      // 200, 503以外は基本的には来ないはずなので、UnexpectedExceptionとして扱う
      throw UnexpectedException(
        response.body,
        response.statusCode,
      );
    }
  }
}
