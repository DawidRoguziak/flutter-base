import 'package:flutter/material.dart';
import 'package:my_finance_calculator/router/AppRouter.gr.dart';

class PageRoot extends StatelessWidget {
  final appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
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
