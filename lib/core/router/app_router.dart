import 'package:codecheck/core/router/app_route.dart';
import 'package:codecheck/presentation/page/search_repository_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter();

  GoRouter get router => _router;

  late final GoRouter _router = GoRouter(
    initialLocation: AppRoute.top.fullPath,
    routes: <RouteBase>[
      GoRoute(
        path: AppRoute.top.fullPath,
        builder: (context, state) => SearchRepositoryPage(),
      ),
    ],
  );
}
