import 'package:my_finance_calculator/pages/PageRoot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future main() async {
  runApp(ProviderScope(
    child: PageRoot(),
  ));
}
