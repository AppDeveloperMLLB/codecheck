import 'dart:convert';
import 'package:codecheck/data/request/search_repositories_request.dart';
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
    final response = await http.get(
      url,
    );

    if (response.statusCode == 200) {
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
    } else {
      throw Exception('Fail to search repository');
    }
  }
}
