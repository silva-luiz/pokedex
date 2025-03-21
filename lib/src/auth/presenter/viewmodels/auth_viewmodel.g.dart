// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthViewmodel on _AuthViewmodelBase, Store {
  Computed<UserEntity?>? _$currentUserComputed;

  @override
  UserEntity? get currentUser =>
      (_$currentUserComputed ??= Computed<UserEntity?>(() => super.currentUser,
              name: '_AuthViewmodelBase.currentUser'))
          .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_AuthViewmodelBase.isLoading'))
          .value;

  late final _$_currentUserAtom =
      Atom(name: '_AuthViewmodelBase._currentUser', context: context);

  @override
  UserEntity? get _currentUser {
    _$_currentUserAtom.reportRead();
    return super._currentUser;
  }

  @override
  set _currentUser(UserEntity? value) {
    _$_currentUserAtom.reportWrite(value, super._currentUser, () {
      super._currentUser = value;
    });
  }

  late final _$_isLoadingAtom =
      Atom(name: '_AuthViewmodelBase._isLoading', context: context);

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$signInAsyncAction =
      AsyncAction('_AuthViewmodelBase.signIn', context: context);

  @override
  Future<void> signIn(String email, String password) {
    return _$signInAsyncAction.run(() => super.signIn(email, password));
  }

  late final _$signOutAsyncAction =
      AsyncAction('_AuthViewmodelBase.signOut', context: context);

  @override
  Future<void> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  @override
  String toString() {
    return '''
currentUser: ${currentUser},
isLoading: ${isLoading}
    ''';
  }
}
