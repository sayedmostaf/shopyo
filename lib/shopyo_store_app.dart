import 'package:flutter/material.dart';
import 'package:shopyo/core/app/env.variables.dart';

class ShopyoStoreApp extends StatelessWidget {
  const ShopyoStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
      title: 'Shopyo Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(appBar: AppBar(title: const Text('Shopyo Store'))),
    );
  }
}
