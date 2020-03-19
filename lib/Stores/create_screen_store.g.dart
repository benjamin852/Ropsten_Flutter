// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateScreenStore on CreateScreenStoreBase, Store {
  final _$mnemonicAtom = Atom(name: 'CreateScreenStoreBase.mnemonic');

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

  final _$mnemonicConfirmAtom =
      Atom(name: 'CreateScreenStoreBase.mnemonicConfirm');

  @override
  String get mnemonicConfirm {
    _$mnemonicConfirmAtom.context.enforceReadPolicy(_$mnemonicConfirmAtom);
    _$mnemonicConfirmAtom.reportObserved();
    return super.mnemonicConfirm;
  }

  @override
  set mnemonicConfirm(String value) {
    _$mnemonicConfirmAtom.context.conditionallyRunInAction(() {
      super.mnemonicConfirm = value;
      _$mnemonicConfirmAtom.reportChanged();
    }, _$mnemonicConfirmAtom, name: '${_$mnemonicConfirmAtom.name}_set');
  }

  final _$stepAtom = Atom(name: 'CreateScreenStoreBase.step');

  @override
  WalletCreateSteps get step {
    _$stepAtom.context.enforceReadPolicy(_$stepAtom);
    _$stepAtom.reportObserved();
    return super.step;
  }

  @override
  set step(WalletCreateSteps value) {
    _$stepAtom.context.conditionallyRunInAction(() {
      super.step = value;
      _$stepAtom.reportChanged();
    }, _$stepAtom, name: '${_$stepAtom.name}_set');
  }

  final _$errorsAtom = Atom(name: 'CreateScreenStoreBase.errors');

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

  final _$confirmMnemonicAsyncAction = AsyncAction('confirmMnemonic');

  @override
  Future<bool> confirmMnemonic() {
    return _$confirmMnemonicAsyncAction.run(() => super.confirmMnemonic());
  }

  final _$CreateScreenStoreBaseActionController =
      ActionController(name: 'CreateScreenStoreBase');

  @override
  void generateMnemonic() {
    final _$actionInfo = _$CreateScreenStoreBaseActionController.startAction();
    try {
      return super.generateMnemonic();
    } finally {
      _$CreateScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMnemonicConfirmation(String mnemonic) {
    final _$actionInfo = _$CreateScreenStoreBaseActionController.startAction();
    try {
      return super.setMnemonicConfirmation(mnemonic);
    } finally {
      _$CreateScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goto(WalletCreateSteps step) {
    final _$actionInfo = _$CreateScreenStoreBaseActionController.startAction();
    try {
      return super.goto(step);
    } finally {
      _$CreateScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearErros() {
    final _$actionInfo = _$CreateScreenStoreBaseActionController.startAction();
    try {
      return super.clearErros();
    } finally {
      _$CreateScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo = _$CreateScreenStoreBaseActionController.startAction();
    try {
      return super.reset();
    } finally {
      _$CreateScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'mnemonic: ${mnemonic.toString()},mnemonicConfirm: ${mnemonicConfirm.toString()},step: ${step.toString()},errors: ${errors.toString()}';
    return '{$string}';
  }
}
