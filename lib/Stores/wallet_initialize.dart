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
}
