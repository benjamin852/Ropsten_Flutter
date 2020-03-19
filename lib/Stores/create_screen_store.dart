import 'package:mobx/mobx.dart';

import 'package:ethereum_flutter/Blockchain/address_services.dart';
import 'package:ethereum_flutter/Stores/wallet_initialize.dart';

part 'create_screen_store.g.dart';

class WalletCreateStore = _WalletCreateStoreBase with _$WalletCreateStore;

enum WalletCreateSteps {
  display,
  confirm,
}

abstract class _WalletCreateStoreBase with Store {
  final WalletInitialize _walletInitialize;
  final IAddressService _iAddressService;

  _WalletCreateStoreBase(
    this._walletInitialize,
    this._iAddressService,
  );

  @observable
  String mnemonic;

  @observable
  String mnemonicConfirm;

  @observable
  WalletCreateSteps step = WalletCreateSteps.display;

  @observable
  ObservableList<String> errors = ObservableList<String>();

  @action
  void generateMnemonic() {
    this.reset();
    _iAddressService.generateMnemonic();
  }

  @action
  void setMnemonicConfirmation(String mnemonic) {
    this.errors.clear();
    this.mnemonicConfirm = mnemonic;
  }

  @action
  void goto(WalletCreateSteps step) {
    this.step = step;
  }

  @action
  void clearErros() {
    this.errors = ObservableList();
  }

  @action
  void reset() {
    this.mnemonic = null;
    this.mnemonicConfirm = null;
    this.errors.clear();
    this.goto(WalletCreateSteps.display);
  }

  @action
  Future<bool> confirmMnemonic() async {
    if (mnemonicConfirm == mnemonic) {
      await _iAddressService.setupFromMnemonic(mnemonic);
      await _walletInitialize.initialise();
      return true;
    }
    this.errors.clear();
    this.errors.add('Invalid mnemonic please try again');
    return false;
  }
}
