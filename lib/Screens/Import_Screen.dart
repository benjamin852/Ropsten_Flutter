import 'package:flutter/material.dart';

import 'package:ethereum_flutter/Widgets/Forms/Paper_Form.dart';

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
          color: Colors.red,
          child: SingleChildScrollView(
            child: PaperForm(
              padding: 30,
              //change this
              actionButtons: <Widget>[
                RaisedButton(
                  child: Text('Import'),
                  onPressed: () {
                    print('if chooses mnemonic then auth via mnemonic');
                    print('if chooses private key then auth via private key');
                  },
                )
              ],
              children: <Widget>[
                //****CHECK GIT LOG */
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildForm() {}
}
