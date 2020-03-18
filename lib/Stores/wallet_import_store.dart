import 'package:ethereum_flutter/Blockchain/address_services.dart';
import 'package:ethereum_flutter/Stores/wallet_initialize.dart';
import 'package:mobx/mobx.dart';
part 'wallet_import_store.g.dart';

class WalletImportStore = _WalletImportStoreBase with _$WalletImportStore;

enum WalletImportType {
  mnemonic,
  privateKey,
}

abstract class _WalletImportStoreBase with Store {
  WalletInitialize walletInitialize;
  IAddressService _addressService;

  _WalletImportStoreBase(
    this.walletInitialize,
    this._addressService,
  );

  @observable
  WalletImportType type = WalletImportType.mnemonic;

  @observable
  String mnemonic;

  @observable
  String privateKey;

  @observable
  ObservableList<String> errors = ObservableList<String>();

  @action
  void reset() {
    this.mnemonic = null;
    this.privateKey = null;
    this.type = WalletImportType.mnemonic;
  }

  @action
  void setMnemonic(String mnemonic) {
    this.errors.clear();
    this.mnemonic = mnemonic;
  }

  @action
  void setPrivateKey(String privateKey) {
    this.errors.clear();
    this.privateKey = privateKey;
  }

  @action
  void setType(WalletImportType type) {
    this.errors.clear();
    this.type = type;
  }

  @action
  Future<bool> authenticateWithPrivateKey(String privateKey) async {
    this.errors.clear();
    try {
      await _addressService.setupFromPrivateKey(privateKey);
      await walletInitialize.initialise();
      return true;
    } catch (e) {
      this.errors.add(e.toString());
    }
    return false;
  }

  @action
  Future<bool> authenticateWithMnemonic() async {
    this.errors.clear();
    try {
      if (_mnemonicArray(mnemonic).length == 12) {
        await _addressService.setupFromMnemonic(mnemonic);
        await walletInitialize.initialise();
        return true;
      }
    } catch (e) {
      this.errors.add(e.toString());
    }
    this.errors.add('Invalid Mnemonic');
    return false;
  }

  //used to remove white space
  List<String> _mnemonicArray(String mnemonic) {
    return mnemonic
        .split(' ')
        .where((word) => word != null && word.trim().isNotEmpty)
        .map((word) => word.trim())
        .toList();
  }

  String _mnemonicString(String mnemonic) {
    return _mnemonicArray(mnemonic).join(' ');
  }

  bool validateMnemonicLength(String mnemonic) {
    return _mnemonicArray(mnemonic).length == 12;
  }
}
