// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_import_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WalletImportStore on _WalletImportStoreBase, Store {
  final _$typeAtom = Atom(name: '_WalletImportStoreBase.type');

  @override
  WalletImportType get type {
    _$typeAtom.context.enforceReadPolicy(_$typeAtom);
    _$typeAtom.reportObserved();
    return super.type;
  }

  @override
  set type(WalletImportType value) {
    _$typeAtom.context.conditionallyRunInAction(() {
      super.type = value;
      _$typeAtom.reportChanged();
    }, _$typeAtom, name: '${_$typeAtom.name}_set');
  }

  final _$mnemonicAtom = Atom(name: '_WalletImportStoreBase.mnemonic');

  @override
  String get mnemonic {
    _$mnemonicAtom.context.enforceReadPolicy(_$mnemonicAtom);
    _$mnemonicAtom.reportObserved();
    return super.mnemonic;
  }

  @override
  set mnemonic(String value) {
    _$mnemonicAtom.context.conditionallyRunInAction(() {
      super.mnemonic = value;
      _$mnemonicAtom.reportChanged();
    }, _$mnemonicAtom, name: '${_$mnemonicAtom.name}_set');
  }

  final _$privateKeyAtom = Atom(name: '_WalletImportStoreBase.privateKey');

  @override
  String get privateKey {
    _$privateKeyAtom.context.enforceReadPolicy(_$privateKeyAtom);
    _$privateKeyAtom.reportObserved();
    return super.privateKey;
  }

  @override
  set privateKey(String value) {
    _$privateKeyAtom.context.conditionallyRunInAction(() {
      super.privateKey = value;
      _$privateKeyAtom.reportChanged();
    }, _$privateKeyAtom, name: '${_$privateKeyAtom.name}_set');
  }

  final _$errorsAtom = Atom(name: '_WalletImportStoreBase.errors');

  @override
  ObservableList<String> get errors {
    _$errorsAtom.context.enforceReadPolicy(_$errorsAtom);
    _$errorsAtom.reportObserved();
    return super.errors;
  }

  @override
  set errors(ObservableList<String> value) {
    _$errorsAtom.context.conditionallyRunInAction(() {
      super.errors = value;
      _$errorsAtom.reportChanged();
    }, _$errorsAtom, name: '${_$errorsAtom.name}_set');
  }

  final _$authenticateWithPrivateKeyAsyncAction =
      AsyncAction('authenticateWithPrivateKey');

  @override
  Future<bool> authenticateWithPrivateKey() {
    return _$authenticateWithPrivateKeyAsyncAction
        .run(() => super.authenticateWithPrivateKey());
  }

  final _$authenticateWithMnemonicAsyncAction =
      AsyncAction('authenticateWithMnemonic');

  @override
  Future<bool> authenticateWithMnemonic() {
    return _$authenticateWithMnemonicAsyncAction
        .run(() => super.authenticateWithMnemonic());
  }

  final _$_WalletImportStoreBaseActionController =
      ActionController(name: '_WalletImportStoreBase');

  @override
  void reset() {
    final _$actionInfo = _$_WalletImportStoreBaseActionController.startAction();
    try {
      return super.reset();
    } finally {
      _$_WalletImportStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMnemonic(String mnemonic) {
    final _$actionInfo = _$_WalletImportStoreBaseActionController.startAction();
    try {
      return super.setMnemonic(mnemonic);
    } finally {
      _$_WalletImportStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrivateKey(String privateKey) {
    final _$actionInfo = _$_WalletImportStoreBaseActionController.startAction();
    try {
      return super.setPrivateKey(privateKey);
    } finally {
      _$_WalletImportStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setType(WalletImportType type) {
    final _$actionInfo = _$_WalletImportStoreBaseActionController.startAction();
    try {
      return super.setType(type);
    } finally {
      _$_WalletImportStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'type: ${type.toString()},mnemonic: ${mnemonic.toString()},privateKey: ${privateKey.toString()},errors: ${errors.toString()}';
    return '{$string}';
  }
}
