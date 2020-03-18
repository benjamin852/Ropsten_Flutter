// import 'package:ethereum_flutter/Blockchain/address_services.dart';
// import 'package:ethereum_flutter/Blockchain/app_config.dart';
import 'package:ethereum_flutter/Blockchain/address_services.dart';
import 'package:ethereum_flutter/Utils/configuration_services.dart';
import 'package:mobx/mobx.dart';

part 'wallet_initialize.g.dart';

class WalletInitialize = _WalletInitialize with _$WalletInitialize;

abstract class _WalletInitialize with Store {
  // final IContractService _contractService;
  final IConfigurationService _configurationService;
  final IAddressService _addressServices;

  _WalletInitialize(
    // this._contractService,
    this._configurationService,
    this._addressServices,
  );

  @observable
  BigInt tokenBalance;

  @observable
  BigInt ethBalance;

  @observable
  String address;

  @observable
  String privateKey;

  // @observable transactions

  Future<void> initialise() async {
    final entropyMnemonic = _configurationService.getMnemonic();
    final privateKey = _configurationService.getPrivateKey();

    if (entropyMnemonic != null && entropyMnemonic.isNotEmpty) {
      _initaliseMnemonic(entropyMnemonic);
      return;
    }
    _initialiseFromPrivateKey(privateKey);
  }

  Future<void> _initaliseMnemonic(String entropyMnemonic) async {
    final mnemonic = _addressServices.entropyToMnemonic(entropyMnemonic);
    final privateKey = _addressServices.getPrivateKey(mnemonic);
    final address = _addressServices.getPublicAddress(privateKey);

    this.address = address.toString();
    this.privateKey = privateKey;
    await _initialise();
  }

  Future<void> _initialiseFromPrivateKey(String privateKey) async {
    final address = _addressServices.getPublicAddress(privateKey);
    this.address = address.toString();
    this.privateKey = privateKey;
    await _initialise();
  }

  Future<void> _initialise() async {
    // await fetchOwnBalance()
    print('to do');
  }

  @action
  Future<void> resetWallet() async {
    await _configurationService.setMnemonic(null);
    await _configurationService.setUpDone(false);
  }
}
