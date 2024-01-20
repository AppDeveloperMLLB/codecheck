import "package:codecheck/core/router/app_router.dart";
import "package:codecheck/presentation/app_theme.dart";
import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter().router;

    final a = [];
    a.map((e) {
      return e.toString();
    });

    return MaterialApp.router(
      title: "Codecheck",
      theme: appTheme,
      routeInformationParser: appRouter.routeInformationParser,
      routerDelegate: appRouter.routerDelegate,
      routeInformationProvider: appRouter.routeInformationProvider,
    );
  }

  void a(int a) {
    return;
  }
}
