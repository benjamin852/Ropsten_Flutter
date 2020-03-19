import 'package:ethereum_flutter/Widgets/Form/paper_form.dart';
import 'package:ethereum_flutter/Widgets/Form/paper_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:ethereum_flutter/Stores/create_screen_store.dart';

class CreateScreen extends StatefulWidget {
  static const routeName = '/create-screen';
  final CreateScreenStore store;
  CreateScreen(this.store);
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  @override
  void initState() {
    super.initState();
    widget.store.generateMnemonic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Screen'),
      ),
      body: Observer(
        builder: (context) {
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

  Widget displayConfirmWidget() {
    return Center(
      child: Container(
        margin: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PaperForm(
              actionButtons: <Widget>[
                OutlineButton(
                  child: const Text('Generate New Mnemonic'),
                  onPressed: () async {
                    widget.store.generateMnemonic();
                  },
                ),
                RaisedButton(
                  child: const Text('Confirm'),
                  onPressed: () async {
                    if (await widget.store.confirmMnemonic()) {
                      Navigator.of(context).pushNamed('/');
                    }
                  },
                )
              ],
              authMechanism: <Widget>[
                PaperInput(
                  labelText: 'Confirm your seed',
                  hintText: 'Please type your seed phrase again',
                  maxLines: 2,
                  onChanged: widget.store.setMnemonicConfirmation,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
