import 'package:flutter/material.dart';

class UiBlock extends StatelessWidget {
  final Widget child;

  const UiBlock({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xAA171A21)),
      child: child,
    );
  }
}
