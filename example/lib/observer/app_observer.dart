
abstract class AppBackPlatformListener {
  void pop();
}

class AppObserver {
  static final AppObserver _singleton = AppObserver._internal();

  factory AppObserver() {
    return _singleton;
  }

  AppObserver._internal();

  List<AppBackPlatformListener> _listeners = [];

  void addListener(AppBackPlatformListener listener) => _listeners.add(listener);

  void removeListener(AppBackPlatformListener listener) => _listeners.remove(listener);

  ///Notify to last listener
  /// true if notify to last listener success
  bool notify() {
    if (_listeners.isEmpty) return false;
    AppBackPlatformListener listener = _listeners.last;
    listener.pop();

    return true;
  }

}