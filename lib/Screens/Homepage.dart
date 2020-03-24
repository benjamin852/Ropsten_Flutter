import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ethereum_flutter/Widgets/app_drawer.dart';
import 'package:ethereum_flutter/Widgets/Wallet/balance.dart';

import 'package:ethereum_flutter/Screens/transfer_screen.dart';

import 'package:ethereum_flutter/Stores/wallet_initialize.dart';

class Homepage extends StatefulWidget {
  static const routeName = '/homepage';

  final WalletInitialize walletInitialize;
  // Homepage(this.walletInitialize, {Key key}) : super(key: key);

  Homepage(this.walletInitialize);
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(widget.walletInitialize.address),
      appBar: AppBar(
        title: Text('Ethereum Ropsten Wallet'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () async {
              await widget.walletInitialize.fetchOwnBalance();
            },
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () =>
                Navigator.of(context).pushNamed(TransferScreen.routeName),
          ),
        ],
      ),
      body: Consumer<WalletInitialize>(
        builder: (context, walletStore, _) => Balance(walletStore),
      ),
    );
  }
}
