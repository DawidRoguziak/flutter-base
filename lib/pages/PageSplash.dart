import 'package:flutter/material.dart';

class PageSplash extends StatelessWidget {
  PageSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LinearProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
