import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_finance_calculator/notifiers/auth/AuthFailure.dart';

part 'StateAuth.freezed.dart';

@freezed
class StateAuth with _$StateAuth {
  const StateAuth._();
  const factory StateAuth.initial() = _Initial;
  const factory StateAuth.unauthenticated() = _Unauthenticated;
  const factory StateAuth.authenticated() = _Authenticated;
  const factory StateAuth.failure(AuthFailure failure) = _Failure;
}
