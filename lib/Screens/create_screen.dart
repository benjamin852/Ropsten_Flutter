import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:ethereum_flutter/Stores/wallet_create_store.dart';

class CreateScreen extends StatefulWidget {
  static const routeName = '/create-screen';
  // final WalletCreateStore store;
  // CreateScreen(this.store);
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  @override
  void initState() {
    super.initState();
    // widget.store.generateMnemonic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Screen'),
      ),
      body: Observer(
        builder: (context) {
          // add turnary based on store condition
          return _displayMnemonic();
        },
      ),
    );
  }

  Widget _displayMnemonic() {
    return Center(
      child: Container(
        margin: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Write down your mnemonic to be extra safe'),
            Container(
              margin: EdgeInsets.all(25),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(border: Border.all()),
              child: Observer(
                builder: (_) => Text(
                  'back in the day the danilewitzs used to hunt their meet and eat it! While they were still hunting it!', //widget.store.mnemonic
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OutlineButton(
                  child: Text('Copy'),
                  onPressed: () {
                    Clipboard.setData(
                      ClipboardData(text: 'Wazy'), //widget.store.mnemonic))
                    );
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Copied"),
                      ),
                    );
                  },
                ),
                RaisedButton(
                  child: const Text('Next'),
                  onPressed: () => print('TO DO'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
