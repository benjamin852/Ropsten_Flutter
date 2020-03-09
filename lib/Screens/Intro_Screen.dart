import 'package:ethereum_flutter/Screens/Import_Screen.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Create A New Wallet'),
              onPressed: () => print('wazy'),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: OutlineButton(
                child: Text('Import Wallet'),
                onPressed: () =>
                    Navigator.of(context).pushNamed(ImportScreen.routeName),
              ),
            )
          ],
        ),
      ),
    );
  }
}
