

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_demo/screens/contain_navigator/plugin_first_screen.dart';

import 'observer/plugin_observer.dart';

class PluginSingleNavigator extends StatelessWidget {

  Future<bool> _onWillPop(BuildContext context) async {
    print('_onWillPop PluginSingleNavigator');
    bool result = PluginObserver().notify();

    return !result;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return _onWillPop(context);
      },
      child: MaterialApp(
        home: PluginFirstScreen(title: "Single Navigator"),
      ),
    );
  }

}