

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_demo/observer/plugin_observer.dart';
import 'package:flutter_plugin_demo/navigator/plugin_navigator.dart';
import 'package:flutter_plugin_demo/screens/plugin_screen2.dart';

class PluginFirstScreen extends StatefulWidget {

  PluginFirstScreen({this.title = "NONE"});
  final String title;
  @override
  State<StatefulWidget> createState() => _PluginState();
}

class _PluginState extends State<PluginFirstScreen> implements BackPlatformListener {

  @override
  bool canPop() => PluginNavigator.canPop(context);

  @override
  void pop() {
    PluginNavigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    PluginObserver().addListener(this);
  }

  @override
  void dispose() {
    PluginObserver().removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('PluginFirstScreen')
      ),
      body: Center(
        child: Column(
          children: [
            Text(this.widget.title),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PluginScreen2(),));
              },
              child: Text("Open plugin screen"),
            ),
          ],
        ),
      ),
    );
  }
}