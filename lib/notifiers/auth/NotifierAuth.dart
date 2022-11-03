import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_finance_calculator/notifiers/auth/StateAuth.dart';
import 'package:my_finance_calculator/services/auth/ServiceGithubAuthenticator.dart';

class NotifierAuth extends StateNotifier<StateAuth> {
  final ServiceGithubAuthenticator _authenticator;

  NotifierAuth(this._authenticator) : super(const StateAuth.initial());

  Future<void> checkAndUpdateAuthStatus() async {
    state = (await _authenticator.isSignedIn())
        ? const StateAuth.authenticated()
        : const StateAuth.unauthenticated();
  }

  Future<void> signIn(Future<Uri> Function()) async {}
}
