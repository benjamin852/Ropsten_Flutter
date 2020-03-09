import 'package:flutter/material.dart';

import 'package:ethereum_flutter/Screens/Intro_Screen.dart';
import 'package:ethereum_flutter/Screens/Import_Screen.dart';

Map<String, WidgetBuilder> getRoutes(context) {
  return {
    IntroScreen.routeName: (BuildContext ctx) => IntroScreen(),
    ImportScreen.routeName: (BuildContext ctx) => ImportScreen(),
  };
}
