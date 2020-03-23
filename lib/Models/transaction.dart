import 'package:web3dart/web3dart.dart';

enum TransactionStatus {
  started,
  confirmed,
}

class Transaction {
  String key;
  String from;
  String to;
  DateTime date;
  String receipt;
  BigInt value;
  TransactionStatus status;

  Transaction() {
    date = DateTime.now();
    status = TransactionStatus.started;
  }

  Transaction setId(String key) {
    this.key = key;
    return this;
    //return a transaction object
  }

  Transaction confirmed(
      EthereumAddress from, EthereumAddress to, BigInt value) {
    this.status = TransactionStatus.confirmed;
    this.from = from.toString();
    this.to = to.toString();
    this.value = value;
    return this;
  }
}
