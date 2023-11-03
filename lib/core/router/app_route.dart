enum AppRoute {
  top(
    fullPath: '/',
    relativePath: '/',
    name: 'top',
  ),
  repositoryDetails(
    fullPath: '/detaills',
    relativePath: 'detaills',
    name: 'repository-details',
  );

  final String fullPath;
  final String relativePath;
  final String name;

  const AppRoute({
    required this.fullPath,
    required this.relativePath,
    required this.name,
  });

  static AppRoute fromName({required String name}) {
    return AppRoute.values.firstWhere((element) => element.name == name);
  }

  static AppRoute fromFullPath({required String fullPath}) {
    return AppRoute.values
        .firstWhere((element) => element.fullPath == fullPath);
  }
}
