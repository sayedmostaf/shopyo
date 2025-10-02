import 'package:flutter/material.dart';
import 'package:shopyo/core/app/connectivity_controller.dart';
import 'package:shopyo/core/app/env.variables.dart';
import 'package:shopyo/core/common/screens/no_network_screen.dart';

class ShopyoStoreApp extends StatelessWidget {
  const ShopyoStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, _) {
        if (value) {
          return MaterialApp(
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
            home: Scaffold(appBar: AppBar(title: const Text('Asroo Store'))),
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
