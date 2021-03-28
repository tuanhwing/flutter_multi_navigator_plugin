

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_demo/flutter_plugin_demo.dart';
import 'package:flutter_plugin_demo_example/observer/app_observer.dart';
import 'package:flutter_plugin_demo_example/screens/use_rootnavigator_screen.dart';
import 'package:flutter_plugin_demo_example/screens/use_subnavigator_screen.dart';

class AppScreen extends StatelessWidget {
  AppScreen({this.useRootNavigator = true});
  final bool useRootNavigator;

  Route generateRoutes(RouteSettings routeSettings) {
    switch(routeSettings.name) {
      case "/useRootNavigator": return MaterialPageRoute(settings: routeSettings, builder: (_) => UseRootNavigatorScreen());
      case "/useSubNavigator": return MaterialPageRoute(settings: routeSettings, builder: (_) => UseSubNavigatorScreen());
      default: return null;
    }
  }

  Future<bool> _onWillPop(BuildContext context) async {
    print('_onWillPop app');
    if (!useRootNavigator) {
      bool result = PluginObserver().notify();
      if (result) return false;
    }
    AppObserver().notify();
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => _onWillPop(context),
        child: Navigator(
          initialRoute: useRootNavigator ? "/useRootNavigator" : "/useSubNavigator",
          onGenerateRoute: generateRoutes,
        )
    );
  }

}