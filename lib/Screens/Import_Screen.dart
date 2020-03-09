import 'package:flutter/material.dart';

import 'package:ethereum_flutter/Widgets/Form/Paper_Form.dart';
import 'package:ethereum_flutter/Widgets/Form/Paper_Radio.dart';
import 'package:ethereum_flutter/Widgets/Form/Paper_Input.dart';

class ImportScreen extends StatefulWidget {
  static const routeName = '/import';

  @override
  _ImportScreenState createState() => _ImportScreenState();
}

class _ImportScreenState extends State<ImportScreen> {
  @override
  void initState() {
    super.initState();
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
                  onPressed: () {
                    print('if chooses mnemonic then auth via mnemonic');
                    print('if chooses private key then auth via private key');
                  },
                )
              ],
              authMechanism: <Widget>[
                Row(
                  children: <Widget>[
                    PaperRadio(
                      title: 'Mnemonic',
                      value: null,
                      groupValue: null,
                      onChanged: null,
                    ),
                    PaperRadio(
                      title: 'Private Key',
                      value: null,
                      groupValue: null,
                      onChanged: null,
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Visibility(
                      child: privateKeyForm(),
                      visible: true,
                    ),
                    Visibility(
                      child: mnemonicForm(),
                      visible: true,
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
          onChanged: null,
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
          onChanged: null,
        ),
      ],
    );
  }
}
