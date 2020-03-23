import 'package:ethereum_flutter/Blockchain/contract_service.dart';
import 'package:ethereum_flutter/Stores/wallet_initialize.dart';
import 'package:mobx/mobx.dart';
import 'package:web3dart/web3dart.dart';
part 'wallet_transfer_store.g.dart';

class WalletTransferStore = _WalletTransferStoreBase with _$WalletTransferStore;

abstract class _WalletTransferStoreBase with Store {
  final WalletInitialize walletInitialize;
  final IContractService _iContractService;
  _WalletTransferStoreBase(this.walletInitialize, this._iContractService);

  @observable
  String to;

  @observable
  String amount;

  @observable
  ObservableList<String> errors = ObservableList<String>();

  @observable
  bool loading;

  @action
  void setTo(String value) {
    this.to = value;
  }

  @action
  void setAmount(String value) {
    this.amount = value;
  }

  @action
  void isLoading(bool value) {
    this.loading = value;
  }

  @action
  void reset() {
    this.to = '';
    this.amount = '';
    this.loading = false;
    this.errors.clear();
  }

  @action
  void setError(String message) {
    isLoading(false);
    this.errors.clear();
    this.errors.add(message);
  }

  @action
  Stream<Transaction> transfer() {}
}
