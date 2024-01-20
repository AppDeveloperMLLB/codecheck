import "package:codecheck/core/router/app_route.dart";
import "package:codecheck/domain/entity/github_repository_data.dart";
import "package:codecheck/presentation/page/repository_details_page.dart";
import "package:codecheck/presentation/page/search_repository_page.dart";
import "package:go_router/go_router.dart";

class AppRouter {
  AppRouter();

  GoRouter get router => _router;

  late final GoRouter _router = GoRouter(
    initialLocation: AppRoute.top.fullPath,
    routes: <RouteBase>[
      GoRoute(
          path: AppRoute.top.fullPath,
          builder: (context, state) => SearchRepositoryPage(),
          routes: [
            GoRoute(
              path: AppRoute.repositoryDetails.relativePath,
              builder: (context, state) {
                final githubRepositoryData =
                    state.extra as GithubRepositoryData;
                return RepositoryDetailsPage(
                  repositoryData: githubRepositoryData,
                );
              },
            ),
          ]),
    ],
  );
}
