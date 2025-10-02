import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class ConnectivityController {
  ConnectivityController._();

  static final ConnectivityController instance = ConnectivityController._();

  ValueNotifier<bool> isConnected = ValueNotifier(true);

  Future<void> init() async {
    final results = await Connectivity().checkConnectivity();
    isInternetConnected(results);
    Connectivity().onConnectivityChanged.listen(isInternetConnected);
  }

  bool isInternetConnected(List<ConnectivityResult> results) {
    if (results.contains(ConnectivityResult.none)) {
      isConnected.value = false;
      return false;
    } else if (results.contains(ConnectivityResult.mobile) ||
        results.contains(ConnectivityResult.wifi)) {
      isConnected.value = true;
      return true;
    }
    return false;
  }
}
