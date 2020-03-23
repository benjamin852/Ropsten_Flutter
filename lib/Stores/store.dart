import 'package:ethereum_flutter/Screens/transfer_screen.dart';
import 'package:provider/provider.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
import 'package:web_socket_channel/io.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ethereum_flutter/Blockchain/address_services.dart';
import 'package:ethereum_flutter/Blockchain/contract_service.dart';

import 'package:ethereum_flutter/Stores/wallet_transfer_store.dart';
import 'package:ethereum_flutter/Stores/create_screen_store.dart';
import 'package:ethereum_flutter/Stores/wallet_initialize.dart';
import 'package:ethereum_flutter/Stores/wallet_import_store.dart';

import 'package:ethereum_flutter/Utils/configuration_services.dart';

import 'package:ethereum_flutter/Blockchain/app_config.dart';
import 'package:ethereum_flutter/Blockchain/contract_parser.dart';

Future<List<SingleChildCloneableWidget>> rootProvider(
    AppConfigParams params) async {
  //used for talking to blockchain in contract_services
  final client = Web3Client(
    params.web3HttpUrl,
    Client(),
    socketConnector: () =>
        IOWebSocketChannel.connect(params.web3RdpUrl).cast<String>(),
  );

  final contract = await ContractParser.parseContract(
      'assets/TargaryenCoin.json', params.contractAddress);

  final sharedPrefs = await SharedPreferences.getInstance();
  //fetch existing address
  final configurationServices = ConfigurationService(sharedPrefs);
  //fetch or create address
  final addressServices = AddressService(configurationServices);

  final contractService = ContractService(client, contract);

  final walletInitializeStore = WalletInitialize(
    configurationServices,
    addressServices,
    contractService,
  );

  final walletImportStore =
      WalletImportStore(walletInitializeStore, addressServices);

  final createScreenStore =
      CreateScreenStore(walletInitializeStore, addressServices);

  final transferStore = WalletTransferStore();

  return [
    Provider<WalletInitialize>(
      create: (_) => walletInitializeStore,
    ),
    Provider<WalletImportStore>(
      create: (_) => walletImportStore,
    ),
    Provider<CreateScreenStore>(
      create: (_) => createScreenStore,
    ),
    Provider<WalletTransferStore>(
      create: (_) => transferStore,
    ),
  ];
}
