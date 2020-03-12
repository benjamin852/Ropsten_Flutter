// import 'package:provider/provider.dart';
import 'package:ethereum_flutter/Blockchain/address_services.dart';
import 'package:ethereum_flutter/Utils/configuration_services.dart';
import 'package:provider/provider.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
import 'package:web_socket_channel/io.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ethereum_flutter/Blockchain/App_Config.dart';

Future<List<SingleChildCloneableWidget>> rootProvider(
    AppConfigParams params) async {
  //used for talking to blockchain in contract_services
  final client = Web3Client(
    params.web3HttpURL,
    Client(),
    socketConnector: () =>
        IOWebSocketChannel.connect(params.web3RdpURL).cast<String>(),
  );

  final sharedPrefs = await SharedPreferences.getInstance();
  final configurationServices = ConfigurationService(sharedPrefs);
  final addressServices = AddressService(configurationServices);
}
