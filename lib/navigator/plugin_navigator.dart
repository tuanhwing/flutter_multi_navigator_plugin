

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class PluginNavigator {

  static bool canPop(BuildContext context, {bool useRootNavigator: false}) {
    var navigatorState = Navigator.of(context, rootNavigator: useRootNavigator);
    return navigatorState.canPop();
  }


  static T pop<T>(BuildContext context, {T result, bool useRootNavigator: false}) {

    var navigatorState = Navigator.of(context, rootNavigator: useRootNavigator);
    if (navigatorState.canPop()) {
      navigatorState.pop(result);
      print('Plugin Navigator pop with result:$result');
    }
    else {
      SystemNavigator.pop();
      print('Plugin Navigator system pop');
    }
    return result;
  }
}