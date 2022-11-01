import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_finance_calculator/pages/PageLogin.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

Future main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

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

    // return MaterialApp(
    //     title: 'MFC',
    //     theme: ThemeData(
    //         fontFamily: 'Raleway',
    //         brightness: Brightness.dark,
    //         primaryColor: const Color(0xAAee4266),
    //         floatingActionButtonTheme: const FloatingActionButtonThemeData(
    //             foregroundColor: Colors.white,
    //             backgroundColor: Color(0xAAee4266))),
    //     darkTheme: ThemeData(
    //         fontFamily: 'Raleway',
    //         brightness: Brightness.dark,
    //         primaryColor: const Color(0xAAee4266),
    //         floatingActionButtonTheme: const FloatingActionButtonThemeData(
    //             foregroundColor: Colors.white,
    //             backgroundColor: Color(0xAAee4266))),
    //     themeMode: ThemeMode.light,
    //     home: StreamBuilder<User?>(
    //       stream: FirebaseAuth.instance.authStateChanges(),
    //       builder: (context, snapshot) {
    //         if (snapshot.hasData) {
    //           return RandomSelectorPage();
    //         } else {
    //           return const PageLogin();
    //         }
    //       },
    //     ));
  }
}
