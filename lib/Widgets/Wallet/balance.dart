import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:ethereum_flutter/Stores/wallet_initialize.dart';

import 'package:ethereum_flutter/Utils/number_formatter.dart';

class Balance extends StatelessWidget {
  final WalletInitialize _walletInitialize;
  Balance(this._walletInitialize);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(_walletInitialize.address),
          OutlineButton(
            child: Text('Copy Address'),
            onPressed: () => Clipboard.setData(
              ClipboardData(text: _walletInitialize.address),
            ),
          ),
          QrImage(data: _walletInitialize.address, size: 150),
          Observer(
            builder: (_) => Text(
              '${NumberFormatter(_walletInitialize.ethBalance).format().substring(0, 4)}',
              style: Theme.of(context).textTheme.body2.apply(fontSizeDelta: 6),
            ),
          ),
          Observer(
            builder: (_) => Text(
              '${NumberFormatter(_walletInitialize.ethBalance).format()}',
              style: Theme.of(context)
                  .textTheme
                  .body2
                  .apply(color: Colors.blueGrey),
            ),
          )
        ],
      ),
    );
  }
}
