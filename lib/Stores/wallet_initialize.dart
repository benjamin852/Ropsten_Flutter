// import 'package:ethereum_flutter/Blockchain/address_services.dart';
// import 'package:ethereum_flutter/Blockchain/app_config.dart';
import 'package:ethereum_flutter/Blockchain/address_services.dart';
import 'package:ethereum_flutter/Blockchain/contract_service.dart';
import 'package:ethereum_flutter/Utils/configuration_services.dart';
import 'package:mobx/mobx.dart';
import 'package:web3dart/web3dart.dart';

part 'wallet_initialize.g.dart';

class WalletInitialize = _WalletInitialize with _$WalletInitialize;

abstract class _WalletInitialize with Store {
  // final IContractService _contractService;
  final IConfigurationService _configurationService;
  final IAddressService _addressServices;
  final ContractService _contractSerivce;

  _WalletInitialize(
      // this._contractService,
      this._configurationService,
      this._addressServices,
      this._contractSerivce);

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
      _initialiseMnemonic(entropyMnemonic);
      return;
    }
    _initialiseFromPrivateKey(privateKey);
  }

  Future<void> _initialiseMnemonic(String entropyMnemonic) async {
    final mnemonic = _addressServices.entropyToMnemonic(entropyMnemonic);
    final privateKey = _addressServices.getPrivateKey(mnemonic);
    final address = await _addressServices.getPublicAddress(privateKey);

    this.address = address.toString();
    this.privateKey = privateKey;
    print('this is the address $address');

    await _initialise();
  }

  Future<void> _initialiseFromPrivateKey(String privateKey) async {
    final address = _addressServices.getPublicAddress(privateKey);
    this.address = address.toString();
    this.privateKey = privateKey;
    await _initialise();
  }

  Future<void> _initialise() async {
    await fetchOwnBalance();
  }

  Future<void> fetchOwnBalance() async {
    var tokenBalance = await _contractSerivce.getTokenBalance(
      EthereumAddress.fromHex(address),
    );
    var ethBalance = await _contractSerivce.getEtherBalance(
      EthereumAddress.fromHex(address),
    );
    this.tokenBalance = tokenBalance;
    this.ethBalance = ethBalance.getInWei;
  }

  @action
  Future<void> resetWallet() async {
    await _configurationService.setMnemonic(null);
    await _configurationService.setUpDone(false);
  }
}
