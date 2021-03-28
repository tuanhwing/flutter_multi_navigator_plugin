
abstract class BackPlatformListener {
  void pop();
  bool canPop();
}


class PluginObserver {
  static final PluginObserver _singleton = PluginObserver._internal();

  factory PluginObserver() {
    return _singleton;
  }

  PluginObserver._internal();

  List<BackPlatformListener> _listeners = [];

  void addListener(BackPlatformListener listener) => _listeners.add(listener);

  void removeListener(BackPlatformListener listener) => _listeners.remove(listener);

  ///Notify to last listener
  /// true if notify to last listener success
  bool notify() {
    if (_listeners.isEmpty) return false;
    BackPlatformListener listener = _listeners.last;
    bool canPop = listener.canPop();
    if (canPop) {
      listener.pop();
      return true;
    }

    return false;
  }

}