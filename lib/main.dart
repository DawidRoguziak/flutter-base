import 'package:my_finance_calculator/pages/PageLogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/extensions/dio.extensions.dart';

Future main() async {
  runApp(const ProviderScope(child: RootWidget()));
}

class RootWidget extends StatelessWidget {
  const RootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        home: PageLogin());
  }
}
