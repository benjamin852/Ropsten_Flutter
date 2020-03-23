import 'package:ethereum_flutter/Widgets/Form/paper_input.dart';
import 'package:flutter/material.dart';

import 'package:ethereum_flutter/Stores/wallet_transfer_store.dart';

import 'package:ethereum_flutter/Widgets/Form/paper_form.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TransferScreen extends StatefulWidget {
  static const routeName = '/transfer-screen';

  final WalletTransferStore walletTransferStore;
  TransferScreen(this.walletTransferStore);

  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfer ERC20 Tokens'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () => print('do'),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          PaperForm(
            paperFormChildren: <Widget>[
              //PaperValidationSummary();
              PaperInput(
                labelText: 'To',
                hintText: 'Type the destination address',
                onChanged: (String toDo) => print('to do'),
              ),
              PaperInput(
                labelText: 'Amount',
                hintText: 'Enter an amount to be sent',
                onChanged: (String toDo) => print('to do'),
              ),
              RaisedButton(
                child: Text('Send'),
                onPressed: () {
                  print('to do');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
