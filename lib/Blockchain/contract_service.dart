import 'dart:async';

import 'package:web3dart/web3dart.dart';

typedef TransferEvent = void Function(
  EthereumAddress from,
  EthereumAddress to,
  BigInt value,
);

abstract class IContractService {
  Future<Credentials> getCredentials(String privateKey);
  Future<String> send(
    String privateKey,
    EthereumAddress receiver,
    BigInt amount, {
    TransferEvent transferEvent,
    Function onError,
  });
  Future<BigInt> getTokenBalance(EthereumAddress address);
  Future<EtherAmount> getEtherBalance(EthereumAddress address);
  Future<void> dispose();
  // StreamSubscription listenTransfer(TransferEvent onTransfer);

}

class ContractService implements IContractService {
  final Web3Client client;
  final DeployedContract contract;
  ContractService(this.client, this.contract);

  ContractEvent _transferEvent() => contract.event('Transfer');
  ContractFunction _balanceFunction() => contract.function('balanceOf');
  ContractFunction _transferFunction() => contract.function('transfer');

  //credentials = anything that can sign payloads with a private key
  Future<Credentials> getCredentials(String privateKey) async {
    return await client.credentialsFromPrivateKey(privateKey);
  }

  Future<EtherAmount> getEtherBalance(EthereumAddress from) async {
    return await client.getBalance(from);
  }

  //call from smart contract itself
  Future<BigInt> getTokenBalance(EthereumAddress from) async {
    var response = await client.call(
      contract: contract,
      function: _balanceFunction(),
      params: [from],
    );
    return response.first as BigInt;
  }

  Future<String> send(
    String privateKey,
    EthereumAddress receiver,
    BigInt amount, {
    TransferEvent transferEvent,
    Function onError,
  }) async {
    final credentials = await getCredentials(privateKey);
    final from = await credentials.extractAddress(); //address from credentials
    final networkId = await client.getNetworkId();

    StreamSubscription stream;

    if (transferEvent != null) {
      //all this is just calling the function below
      //receives event as a stream
      stream = listenTransfer(
        (from, to, value) async {
          transferEvent(from, to, value);
          stream.cancel();
        },
        take: 1,
      );

      try {
        final transactionId = await client.sendTransaction(
          credentials,
          Transaction.callContract(
            contract: contract,
            function: _transferFunction(),
            parameters: [
              receiver,
              amount,
            ],
            from: from,
          ),
          chainId: networkId,
        );
        return transactionId;
      } catch (e) {
        onError(e);
        return null;
      }
    }
  }

  StreamSubscription listenTransfer(TransferEvent transferEvent, {int take}) {
    var events = client.events(
      FilterOptions.events(
        contract: contract,
        event: _transferEvent(),
      ),
    );

    if (take != null) {
      events = events.take(take);
    }

    return events.listen((event) {
      final decoded = _transferEvent().decodeResults(event.topics, event.data);
      final from = decoded[0] as EthereumAddress;
      final to = decoded[1] as EthereumAddress;
      final value = decoded[2] as BigInt;

      transferEvent(from, to, value);
    });
  }

  Future<void> dispose() async {
    await client.dispose();
  }
}
