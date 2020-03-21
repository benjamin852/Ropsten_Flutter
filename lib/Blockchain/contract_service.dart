import 'dart:async';

import 'package:web3dart/web3dart.dart';

abstract class IContractService {
  Future<Credentials> getCredentials(String privateKey);
  Future<String> send(
      String privateKey, EthereumAddress receiver, BigInt amount);
  Future<BigInt> getTokenBalance(EthereumAddress address);
  Future<EtherAmount> getEtherBalance(EthereumAddress address);
  Future<void> dispose();
  // StreamSubscription listenTransfer(TransferEvent onTransfer);

}

class ContractService {
  final Web3Client client;
  final DeployedContract contract;
  ContractService(this.client, this.contract);

  ContractEvent _transferEvent() => contract.event('Transfer');
}
