import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shopyo/core/language/app_localizations.dart';

class AppInfo {
  AppInfo._();
  static Future<String> getAppVersion(BuildContext context) async {
    var buildNumberText = '';
    if (AppLocalizations.of(context)!.isEnLocale) {
      final packageInfo = await PackageInfo.fromPlatform();
      buildNumberText = '${packageInfo.version}(${packageInfo.buildNumber})';
    } else {
      final packageInfo = await PackageInfo.fromPlatform();
      buildNumberText = '(${packageInfo.buildNumber})${packageInfo.version}';
    }
    return buildNumberText;
  }
}
