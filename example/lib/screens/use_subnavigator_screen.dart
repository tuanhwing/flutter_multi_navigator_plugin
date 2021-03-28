

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_demo/flutter_plugin_demo.dart';
import 'package:flutter_plugin_demo/screens/plugin_screen2.dart';
import 'package:flutter_plugin_demo_example/navigator/app_navigator.dart';
import 'package:flutter_plugin_demo_example/observer/app_observer.dart';

class UseSubNavigatorScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UseSubNavigatorState();
}

class _UseSubNavigatorState extends State<UseSubNavigatorScreen> implements AppBackPlatformListener {

  @override
  void pop() {
    AppNavigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    AppObserver().addListener(this);
  }

  @override
  void dispose() {
    AppObserver().removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Use Sub Navigator')
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PluginScreen2())
                );
              },
              child: Text("Open plugin screen <=> none navigator(use Sub)"),
            ),

            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PluginSingleNavigator())
                );
              },
              child: Text("Open plugin single navigator(use Sub)"),
            ),

            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PluginMultiNavigator())
                );
              },
              child: Text("Open plugin multi navigator(use Sub)"),
            ),
          ],
        ),
      ),
    );
  }
}