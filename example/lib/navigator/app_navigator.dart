

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class AppNavigator {

  static T pop<T>(BuildContext context, {T result, bool useRootNavigator: false}) {

    var navigatorState = Navigator.of(context, rootNavigator: useRootNavigator);
    if (navigatorState.canPop()) {
      navigatorState.pop(result);
      print('App Navigator pop with result:$result');
    }
    else {
      SystemNavigator.pop();
      print('App Navigator system pop');
    }
    return result;
  }
}