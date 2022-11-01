import 'package:flutter/services.dart';
import 'package:my_finance_calculator/storage/credentials/StorageCredentials.dart';
import 'package:oauth2/oauth2.dart';

class ServiceGithubAuthenticator {
  final StorageCredentials _storageCredentials;

  ServiceGithubAuthenticator(this._storageCredentials);

  Future<Credentials?> getSignedInCredentials() async {
    try {
      final storedCredentials = await _storageCredentials.read();
      if (storedCredentials != null) {
        if (storedCredentials.canRefresh && storedCredentials.isExpired) {
          // refresh method
        }
      }

      return storedCredentials;
    } on PlatformException {
      return null;
    }
  }

  Future<bool> isSignedIn() =>
      getSignedInCredentials().then((credentials) => credentials != null);
}
