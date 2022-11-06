import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_finance_calculator/core/auth/ProviderAuth.dart';
import 'package:my_finance_calculator/core/auth/StateAuth.dart';
import 'package:my_finance_calculator/router/AppRouter.gr.dart';
import 'dart:developer';

final initializationProvider = FutureProvider((ref) async {
  final notifierAuth = ref.read(providerAuthNotifier.notifier);
  await notifierAuth.checkAndUpdateAuthStatus();
});

class PageRoot extends ConsumerWidget {
  final appRouter = AppRouter();

  PageRoot({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // only for create providers
    ref.listen(initializationProvider, (previous, next) => {});
    ref.listen<StateAuth>(
      providerAuthNotifier,
      ((previous, next) {
        next.maybeMap(
            orElse: () {},
            authenticated: (_) {
              appRouter.pushAndPopUntil(
                PageStarredReposRoute(),
                predicate: (route) => false,
              );
            },
            unauthenticated: (_) {
              appRouter.pushAndPopUntil(
                PageSignInRoute(),
                predicate: (route) => false,
              );
            });
      }),
    );

    return MaterialApp.router(
      title: 'MFC',
      theme: ThemeData(
          fontFamily: 'Raleway',
          brightness: Brightness.dark,
          primaryColor: const Color(0xAAee4266),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              foregroundColor: Colors.white,
              backgroundColor: Color(0xAAee4266))),
      darkTheme: ThemeData(
          fontFamily: 'Raleway',
          brightness: Brightness.dark,
          primaryColor: const Color(0xAAee4266),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              foregroundColor: Colors.white,
              backgroundColor: Color(0xAAee4266))),
      themeMode: ThemeMode.light,
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
