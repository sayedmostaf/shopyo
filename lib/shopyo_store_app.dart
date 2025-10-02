import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/core/app/connectivity_controller.dart';
import 'package:shopyo/core/app/env.variables.dart';
import 'package:shopyo/core/common/screens/no_network_screen.dart';
import 'package:shopyo/core/style/fonts/font_family_helper.dart';

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
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              builder: (context, widget) {
                return Scaffold(
                  body: Builder(
                    builder: (context) {
                      ConnectivityController.instance.init();
                      return widget!;
                    },
                  ),
                );
              },
              home: Scaffold(
                appBar: AppBar(title: const Text('Shopyo Store')),
                body: const Center(
                  child: Column(
                    children: [
                      // Old
                      Text(
                        'Old Font',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'سيد مصطفي',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      // New
                      Text(
                        'Old Font',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: FontFamilyHelper.poppinsEnglish,
                          fontWeight: FontWeightHelper.bold,
                        ),
                      ),

                      Text(
                        'سيد مصطفي',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: FontFamilyHelper.cairoArabic,
                          fontWeight: FontWeightHelper.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
