import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert' show json;

import 'package:shopyo/core/language/app_localizations_delegate.dart';

class AppLocalizations {
  AppLocalizations(this.locale);
  final Locale locale;
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationsDelegate();
  late Map<String, String> _localizedStrings;
  Future<void> load() async {
    final jaonString = await rootBundle.loadString(
      'lang/${locale.languageCode}.json',
    );
    final jsonMap = json.decode(jaonString) as Map<String, dynamic>;
    _localizedStrings = jsonMap.map<String, String>((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  String? translate(String key) => _localizedStrings[key];
  bool get isEnLocale => locale.languageCode == 'en';
}
