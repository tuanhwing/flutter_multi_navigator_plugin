import 'package:flutter/material.dart';

import 'package:flutter_plugin_demo_example/app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: AppScreen(),//uncomment this if u use root navigator to present plugin's screen
      home: AppScreen(useRootNavigator: false),

    );
  }
}
