import 'package:flutter/material.dart';

import 'package:ethereum_flutter/Utils/Routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new MaterialApp(
        title: 'Ethereum Flutter Wallet',
        initialRoute: '/',
        routes: getRoutes(context),
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.white38,
            textTheme: ButtonTextTheme.primary,
          ),
        ),
      ),
    );
  }
}
