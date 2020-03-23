import 'package:ethereum_flutter/Screens/transfer_scren.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ethereum_flutter/Screens/intro_screen.dart';
import 'package:ethereum_flutter/Screens/import_screen.dart';
import 'package:ethereum_flutter/Screens/create_screen.dart';
import 'package:ethereum_flutter/Screens/Homepage.dart';

import 'package:ethereum_flutter/Stores/wallet_initialize.dart';
import 'package:ethereum_flutter/Stores/wallet_import_store.dart';
import 'package:ethereum_flutter/Stores/create_screen_store.dart';
import 'package:ethereum_flutter/Stores/wallet_transfer_store.dart';

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
    Homepage.routeName: (BuildContext context) => Consumer<WalletInitialize>(
          builder: (ctx, walletInitialize, _) => Homepage(walletInitialize),
        ),
    TransferScreen.routeName: (BuildContext context) =>
        Consumer<WalletTransferStore>(
          builder: (ctx, walletTransferStore, _) =>
              TransferScreen(walletTransferStore),
        ),
  };
}
