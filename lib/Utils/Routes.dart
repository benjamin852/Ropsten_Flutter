import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ethereum_flutter/Screens/intro_screen.dart';
import 'package:ethereum_flutter/Screens/import_screen.dart';
import 'package:ethereum_flutter/Screens/create_screen.dart';

import 'package:ethereum_flutter/Stores/wallet_import_store.dart';
import 'package:ethereum_flutter/Stores/create_screen_store.dart';

Map<String, WidgetBuilder> getRoutes(context) {
  return {
    IntroScreen.routeName: (BuildContext context) => IntroScreen(),
    ImportScreen.routeName: (BuildContext context) =>
        Consumer<WalletImportStore>(
          builder: (ctx, walletImportStore, _) =>
              ImportScreen(walletImportStore),
        ),
    CreateScreen.routeName: (BuildContext context) =>
        Consumer<CreateScreenStore>(
          builder: (ctx, createScreenStore, _) =>
              CreateScreen(createScreenStore),
        ),
  };
}
