import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_finance_calculator/notifiers/auth-failure/AuthFailure.dart';
import 'package:my_finance_calculator/storage/credentials/StorageCredentials.dart';
import 'package:my_finance_calculator/core/utils/encoders.dart';
import 'package:oauth2/oauth2.dart';
import 'package:my_finance_calculator/secrets.dart';
import 'package:http/http.dart' as http;
import 'package:my_finance_calculator/core/extensions/dio.extensions.dart';

class GithubOAuthHttpClient extends http.BaseClient {
  final httpClient = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Accept'] = 'application/json';

    return httpClient.send(request);
  }
}

class ServiceGithubAuthenticator {
  final StorageCredentials _storageCredentials;
  final Dio _dio;

  ServiceGithubAuthenticator(this._storageCredentials, this._dio);

  static const clientId = SECRETS_CLIENT_ID;
  static const clientSecret = SECRETS_CLIENT_SECRET;
  static const scopes = ['read:user', 'repo'];

  static final authorizationEndpoint =
      Uri.parse('https://github.com/login/oauth/authorize');

  static final tokenEndpoint =
      Uri.parse('https://github.com/login/oauth/access_token');

  static final revocationEndpoint =
      Uri.parse('https://api.github.com/applications/${clientId}/token');

  static final redirectUrl = Uri.parse('http://localhost:3000/callback');

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

  AuthorizationCodeGrant codeGrant() {
    return AuthorizationCodeGrant(
        clientId, authorizationEndpoint, tokenEndpoint,
        httpClient: GithubOAuthHttpClient(), secret: clientSecret);
  }

  Uri getAuthorizationUrl(AuthorizationCodeGrant grant) {
    return grant.getAuthorizationUrl(redirectUrl, scopes: scopes);
  }

  Future<Either<AuthFailure, Unit>> handleAuthorizationResponse(
      AuthorizationCodeGrant grant, Map<String, String> queryParams) async {
    try {
      final httpClient = await grant.handleAuthorizationResponse(queryParams);
      await _storageCredentials.save(httpClient.credentials);
      return right(unit);
    } on FormatException {
      return left(const AuthFailure.server());
    } on AuthorizationException catch (e) {
      return left(AuthFailure.server('${e.error}: ${e.description}'));
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }

  Future<Either<AuthFailure, Unit>> singOut() async {
    final accessToken = await _storageCredentials
        .read()
        .then((credentials) => credentials?.accessToken);

    final usernameAndPassword =
        stringToBase64.encode('$clientId:$clientSecret');

    try {
      try {
        _dio.deleteUri(
          revocationEndpoint,
          data: {'access_token': accessToken},
          options: Options(
            headers: {
              'Authorization': 'basic $usernameAndPassword',
            },
          ),
        );
      } on DioError catch (e) {
        if (e.isNoConnectionError) {
          // Ignoring
        } else {
          rethrow;
        }
      }

      await _storageCredentials.clear();
      return right(unit);
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }

  Future<Either<AuthFailure, Credentials>> refersh(
    Credentials credentials,
  ) async {
    try {
      final refreshedCredentials = await credentials.refresh(
          identifier: clientId,
          secret: clientId,
          httpClient: GithubOAuthHttpClient());

      await _storageCredentials.save(refreshedCredentials);
      return right(refreshedCredentials);
    } on FormatException {
      return left(const AuthFailure.server());
    } on AuthorizationException catch (e) {
      return left(AuthFailure.server('${e.error}: ${e.description}'));
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }
}
