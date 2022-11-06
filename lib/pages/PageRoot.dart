import 'package:flutter/material.dart';

class PageRoot extends StatelessWidget {
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
    );
  }
}
