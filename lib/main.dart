import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ethereum_flutter/Blockchain/app_config.dart';
import 'package:ethereum_flutter/Stores/store.dart';

import 'package:ethereum_flutter/Utils/Routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final stores = await rootProvider(AppConfig().params['ropsten']);
  runApp(MyApp(stores));
}

class MyApp extends StatelessWidget {
  final stores;
  MyApp(this.stores);
  @override
  Widget build(BuildContext context) {
    print('stores: $stores');
    return MultiProvider(
      providers: stores,
      child: Center(
        child: new MaterialApp(
          title: 'Ethereum Flutter Wallet',
          initialRoute: '/create-screen',
          routes: getRoutes(context),
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            buttonTheme: ButtonThemeData(
              buttonColor: Colors.white38,
              textTheme: ButtonTextTheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
