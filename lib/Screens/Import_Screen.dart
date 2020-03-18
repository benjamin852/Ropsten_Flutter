import 'package:flutter/material.dart';

import 'package:ethereum_flutter/Widgets/Form/Paper_Form.dart';
import 'package:ethereum_flutter/Widgets/Form/Paper_Radio.dart';
import 'package:ethereum_flutter/Widgets/Form/Paper_Input.dart';

import 'package:ethereum_flutter/Stores/wallet_import_store.dart';

class ImportScreen extends StatefulWidget {
  static const routeName = '/import';

  final WalletImportStore store;

  ImportScreen(this.store);

  @override
  _ImportScreenState createState() => _ImportScreenState();
}

class _ImportScreenState extends State<ImportScreen> {
  @override
  void initState() {
    super.initState();
    widget.store.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title from store'),
      ),
      // body: Observer(builder: (_) => buildForm()),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(25),
          color: Colors.grey[200],
          child: SingleChildScrollView(
            child: PaperForm(
              actionButtons: <Widget>[
                RaisedButton(
                  child: Text('Import'),
                  onPressed: () async {
                    if (widget.store.type == WalletImportType.mnemonic &&
                        await widget.store.authenticateWithMnemonic()) {
                      print('navigate to the homepage');
                    }
                    if (widget.store.type == WalletImportType.privateKey &&
                        await widget.store.authenticateWithPrivateKey()) {
                      print('navigate to homepage');
                    }
                  },
                )
              ],
              authMechanism: <Widget>[
                Row(
                  children: <Widget>[
                    PaperRadio(
                      title: 'Mnemonic',
                      value: WalletImportType.mnemonic,
                      groupValue: widget.store.type,
                      onChanged: (value) => widget.store.setType(value),
                    ),
                    PaperRadio(
                      title: 'Private Key',
                      value: WalletImportType.mnemonic,
                      groupValue: widget.store.type,
                      onChanged: (value) => widget.store.setType(value),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Visibility(
                      child: privateKeyForm(),
                      visible: widget.store.type == WalletImportType.privateKey,
                    ),
                    Visibility(
                      child: mnemonicForm(),
                      visible: widget.store.type == WalletImportType.mnemonic,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget privateKeyForm() {
    return Column(
      children: <Widget>[
        //PaperValidationSummary() todo<-
        PaperInput(
          labelText: 'Private Key',
          hintText: 'Type your private key',
          maxLines: 3,
          onChanged: (value) => widget.store.setPrivateKey(value),
        ),
      ],
    );
  }

  Widget mnemonicForm() {
    return Column(
      children: <Widget>[
        // PaperValidationSummary() toDo<-
        PaperInput(
          labelText: 'Mnemonic',
          hintText: 'Type your mnemonic',
          maxLines: 3,
          onChanged: (value) => widget.store.setMnemonic(value),
        ),
      ],
    );
  }
}
