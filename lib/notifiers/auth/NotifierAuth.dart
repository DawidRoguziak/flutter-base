import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_finance_calculator/notifiers/auth/StateAuth.dart';
import 'package:my_finance_calculator/services/auth/ServiceGithubAuthenticator.dart';

typedef AuthUriCallback = Future<Uri> Function(Uri authorizationUrl);

class NotifierAuth extends StateNotifier<StateAuth> {
  final ServiceGithubAuthenticator _authenticator;

  NotifierAuth(this._authenticator) : super(const StateAuth.initial());

  Future<void> checkAndUpdateAuthStatus() async {
    state = (await _authenticator.isSignedIn())
        ? const StateAuth.authenticated()
        : const StateAuth.unauthenticated();
  }

  Future<void> signIn(AuthUriCallback authorizationCallBack) async {
    final grant = _authenticator.codeGrant();
    final redirectUrl =
        await authorizationCallBack(_authenticator.getAuthorizationUrl(grant));
    final failureOrSuccess = await _authenticator.handleAuthorizationResponse(
      grant,
      redirectUrl.queryParameters,
    );

    state = failureOrSuccess.fold(
      (l) => StateAuth.failure(l),
      (r) => const StateAuth.authenticated(),
    );

    grant.close(); // grant keep some memory after auth so clear that
  }

  Future<void> singOut() async {
    final failureOrSuccess = await _authenticator.singOut();

    state = failureOrSuccess.fold(
      (l) => StateAuth.failure(l),
      (r) => const StateAuth.unauthenticated(),
    );
  }
}
