// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterViewmodel on _RegisterViewmodelBase, Store {
  late final _$errorMessageAtom =
      Atom(name: '_RegisterViewmodelBase.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$isSuccessAtom =
      Atom(name: '_RegisterViewmodelBase.isSuccess', context: context);

  @override
  bool get isSuccess {
    _$isSuccessAtom.reportRead();
    return super.isSuccess;
  }

  @override
  set isSuccess(bool value) {
    _$isSuccessAtom.reportWrite(value, super.isSuccess, () {
      super.isSuccess = value;
    });
  }

  late final _$registerUserAsyncAction =
      AsyncAction('_RegisterViewmodelBase.registerUser', context: context);

  @override
  Future<void> registerUser(BuildContext context) {
    return _$registerUserAsyncAction.run(() => super.registerUser(context));
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
isSuccess: ${isSuccess}
    ''';
  }
}
