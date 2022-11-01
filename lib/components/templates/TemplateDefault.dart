import 'package:flutter/material.dart';

class TemplateDefault extends StatefulWidget {
  final Widget child;
  final String? pageTitle;

  final FloatingActionButton? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const TemplateDefault(
      {Key? key,
      required this.child,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.pageTitle})
      : super(key: key);

  @override
  State<TemplateDefault> createState() => _TemplateDefaultState();
}

class _TemplateDefaultState extends State<TemplateDefault> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          widget.pageTitle ?? 'MFC',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: SafeArea(
        child: widget.child,
      ),
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
    );
  }
}
