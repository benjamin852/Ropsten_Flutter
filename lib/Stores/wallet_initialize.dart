// import 'package:ethereum_flutter/Blockchain/address_services.dart';
// import 'package:ethereum_flutter/Blockchain/app_config.dart';
import 'package:mobx/mobx.dart';

part 'wallet_initialize.g.dart';

class WalletInitialize extends _WalletInitialize with _$WalletInitialize {}

abstract class _WalletInitialize with Store {
  @observable
  BigInt tokenBalance;

  @observable
  BigInt ethBalance;

  @observable
  String address;

  @observable
  String privateKey;
}
