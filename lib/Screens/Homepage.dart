import 'package:ethereum_flutter/Stores/wallet_initialize.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  static const routeName = '/homepage';

  //his app does not use a private variable
  // final WalletInitialize _walletInitialize;
  // Homepage(this._walletInitialize);
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
