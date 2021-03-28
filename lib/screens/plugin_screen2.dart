
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PluginScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('PluginScreen')
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => PluginScreen2(),));
          },
          child: Text("Open plugin screen"),
        ),
      ),
    );
  }

}