

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_demo/screens/contain_navigator/plugin_first_screen.dart';

class PluginContainNavigatorScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: "/pluginscreen",
      onGenerateRoute: (routeSettings) {
        switch(routeSettings.name) {
          case "/pluginscreen": return MaterialPageRoute(settings: routeSettings, builder: (_) => PluginFirstScreen(title: "Multi navigator"));
          default: return null;
        }
      },
    );
  }
}