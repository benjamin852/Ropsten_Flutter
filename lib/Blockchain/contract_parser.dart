import 'dart:convert';

import 'package:web3dart/contracts.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:web3dart/web3dart.dart';

class ContractParser {
  static Future<DeployedContract> parseContract(
      String path, String contractAddress) async {
    final jsonContract = jsonDecode(
      await rootBundle.loadString('assets/TargaryenCoin.json'),
    );
    print('${jsonContract['contractName']}');
    return DeployedContract(
      ContractAbi.fromJson(
          jsonEncode(jsonContract['abi']), jsonContract['contractName']),
      EthereumAddress.fromHex(contractAddress),
    );
  }
}
