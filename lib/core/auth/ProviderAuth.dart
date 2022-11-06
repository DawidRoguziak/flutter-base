import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_finance_calculator/core/auth/NotifierAuth.dart';
import 'package:my_finance_calculator/core/auth/StateAuth.dart';
import 'package:my_finance_calculator/core/auth/storage/StorageCredentials.dart';
import 'package:my_finance_calculator/core/auth/storage/StorageCredentialsSecure.dart';
import 'package:my_finance_calculator/core/auth/ServiceGithubAuthenticator.dart';
import 'package:my_finance_calculator/core/http/ProviderDio.dart';
import 'package:riverpod/riverpod.dart';

final providerFlutterSecureStorage =
    Provider((ref) => const FlutterSecureStorage());
final providerCredentialsStorage = Provider<StorageCredentials>(
    (ref) => StorageCredentialsSecure(ref.watch(providerFlutterSecureStorage)));

final providerGithubAuthenticator = Provider(
  (ref) => ServiceGithubAuthenticator(
    ref.watch(providerCredentialsStorage),
    ref.watch(providerDio),
  ),
);

final providerAuthNotifier = StateNotifierProvider<NotifierAuth, StateAuth>(
  (ref) => NotifierAuth(ref.watch(providerGithubAuthenticator)),
);
