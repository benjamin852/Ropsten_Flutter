import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:ethereum_flutter/Widgets/Form/paper_input.dart';
import 'package:ethereum_flutter/Widgets/pending_transaction.dart';
import 'package:ethereum_flutter/Widgets/Form/paper_form.dart';

import 'package:ethereum_flutter/Screens/homepage.dart';

import 'package:ethereum_flutter/Stores/wallet_transfer_store.dart';

import 'package:ethereum_flutter/Models/transaction.dart';

class TransferScreen extends StatefulWidget {
  static const routeName = '/transfer-screen';

  final WalletTransferStore walletTransferStore;
  TransferScreen(this.walletTransferStore);

  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  @override
  void initState() {
    super.initState();
    widget.walletTransferStore.reset();
  }

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
      body: Observer(
        builder: (context) {
          return displayTransferScreen();
        },
      ),
    );
  }

  Widget displayTransferScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        PaperForm(
          paperFormChildren: <Widget>[
            //PaperValidationSummary();
            PaperInput(
              labelText: 'To',
              hintText: 'Type the destination address',
              onChanged: (value) => widget.walletTransferStore.setTo(value),
            ),
            PaperInput(
              labelText: 'Amount',
              hintText: 'Enter an amount to be sent',
              onChanged: (value) => widget.walletTransferStore.setAmount(value),
            ),
            RaisedButton(
              child: Text('Send'),
              onPressed: !widget.walletTransferStore.loading
                  ? () {
                      widget.walletTransferStore
                          .transfer()
                          .listen((transaction) {
                        switch (transaction.status) {
                          case TransactionStatus.started:
                            Navigator.pushNamed(
                              context,
                              PendingTransaction.routeName,
                            );
                            break;
                          case TransactionStatus.confirmed:
                            Navigator.popUntil(
                              context,
                              ModalRoute.withName(Homepage.routeName),
                            );
                            break;
                        }
                      }).onError((handleError) => widget.walletTransferStore
                              .setError(handleError.message));
                    }
                  : null,
            ),
          ],
        ),
      ],
    );
  }
}
