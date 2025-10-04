import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/core/app/connectivity_controller.dart';
import 'package:shopyo/core/app/env.variables.dart';
import 'package:shopyo/core/common/screens/no_network_screen.dart';
import 'package:shopyo/core/language/app_localizations_setup.dart';
import 'package:shopyo/core/routes/app_routes.dart';
import 'package:shopyo/core/style/fonts/font_family_helper.dart';
import 'package:shopyo/core/style/theme/app_theme.dart';

import 'core/style/fonts/font_weight_helper.dart';

class ShopyoStoreApp extends StatelessWidget {
  const ShopyoStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, _) {
        if (value) {
          return ScreenUtilInit(
            minTextAdapt: true,
            designSize: const Size(375, 812),
            child: MaterialApp(
              title: 'Shopyo Store',
              debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
              theme: themeDark(),
              locale: Locale('ar'),
              supportedLocales: AppLocalizationsSetup.supportedLocales,
              localizationsDelegates:
                  AppLocalizationsSetup.localizationsDelegates,
              localeResolutionCallback:
                  AppLocalizationsSetup.localeResolutionCallback,
              builder: (context, widget) {
                return GestureDetector(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: Scaffold(
                    body: Builder(
                      builder: (context) {
                        ConnectivityController.instance.init();
                        return widget!;
                      },
                    ),
                  ),
                );
              },
              onGenerateRoute: AppRoutes.onGenerateRoute,
              initialRoute: AppRoutes.testOne,
            ),
          );
        } else {
          return MaterialApp(
            title: 'No Network',
            debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
            home: NoNetworkScreen(),
          );
        }
      },
    );
  }
}
