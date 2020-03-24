import 'package:mobx/mobx.dart';
import 'dart:async';
import 'dart:math';

import 'package:ethereum_flutter/Blockchain/contract_service.dart';
import 'package:ethereum_flutter/Stores/wallet_initialize.dart';

import 'package:ethereum_flutter/Models/transaction.dart';
import 'package:web3dart/credentials.dart';

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
  Stream<Transaction> transfer() {
    var streamController = StreamController<Transaction>();
    var transactionEvent = Transaction();
    isLoading(true);

    _iContractService
        .send(
      walletInitialize.privateKey,
      EthereumAddress.fromHex(this.to),
      BigInt.from(double.parse(this.amount) * pow(10, 18)),
      transferEvent: (from, to, value) {
        streamController.add(transactionEvent.confirmed(from, to, value));
        streamController.close();
        isLoading(false);
      },
      onError: (error) => streamController.addError(error),
    )
        .then(
      (id) {
        if (id != null) streamController.add(transactionEvent.setId(id));
      },
    );
    return streamController.stream;
  }
}
