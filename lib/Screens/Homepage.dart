import 'package:flutter/material.dart';

import 'package:ethereum_flutter/Widgets/app_drawer.dart';
import 'package:ethereum_flutter/Widgets/Wallet/balance.dart';

import 'package:ethereum_flutter/Stores/wallet_initialize.dart';

class Homepage extends StatefulWidget {
  static const routeName = '/homepage';

  //his app does not use a private variable
  final WalletInitialize _walletInitialize;
  Homepage(this._walletInitialize);
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(widget._walletInitialize.address),
      appBar: AppBar(
        title: Text('Ethereum Wallet'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () async {
              await widget._walletInitialize.fetchOwnBalance();
            },
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () => print('to do'),
          ),
        ],
      ),
      body: Balance(widget._walletInitialize),
    );
  }
}
