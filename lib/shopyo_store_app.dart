import 'package:flutter/material.dart';

class ShopyoStoreApp extends StatelessWidget {
  const ShopyoStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopyo Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(appBar: AppBar(title: const Text('Shopyo Store'))),
    );
  }
}
