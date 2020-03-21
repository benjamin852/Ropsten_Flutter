import 'package:flutter/material.dart';

import 'package:ethereum_flutter/Widgets/app_drawer.dart';
import 'package:ethereum_flutter/Widgets/Wallet/balance.dart';

import 'package:ethereum_flutter/Stores/wallet_initialize.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Homepage extends StatefulWidget {
  static const routeName = '/homepage';

  final WalletInitialize walletInitialize;
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
        // title: Text('Ethereum Wallet'),
        title: Text('Ethereum App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () async {
              await widget.walletInitialize.fetchOwnBalance();
            },
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () => print('to do'),
          ),
        ],
      ),

      body: Observer(builder: (_) => buildBody()),
      // body: Balance(widget.walletInitialize),
    );
  }

  Widget buildBody() {
    return Balance(widget.walletInitialize);
  }
}
