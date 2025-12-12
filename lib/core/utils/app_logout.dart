import 'package:flutter/cupertino.dart';
import 'package:shopyo/core/di/injection_container.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/core/routes/app_routes.dart';
import 'package:shopyo/core/service/shared_pref/pref_keys.dart';
import 'package:shopyo/core/service/shared_pref/shared_pref.dart';

class AppLogout {
  AppLogout._();
  factory AppLogout() {
    return _instance;
  }
  static final AppLogout _instance = AppLogout._();
  Future<void> logout() async {
    final context = sl<GlobalKey<NavigatorState>>().currentState!.context;
    await SharedPref().removePreference(PrefKeys.accessToken);
    await SharedPref().removePreference(PrefKeys.userId);
    await SharedPref().removePreference(PrefKeys.userRole);
    if (!context.mounted) return;
    await context.pushNamedAndRemoveUntil(AppRoutes.login);
  }
}
