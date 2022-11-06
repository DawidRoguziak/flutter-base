import 'package:flutter/material.dart';

class PageAuthorization extends StatefulWidget {
  final Uri authUrl;
  final void Function(Uri redirectUrl) onAuthCodeRedirectAttempt;

  const PageAuthorization(
      {super.key,
      required this.authUrl,
      required this.onAuthCodeRedirectAttempt});

  @override
  State<PageAuthorization> createState() => _PageAuthorizationState();
}

class _PageAuthorizationState extends State<PageAuthorization> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
