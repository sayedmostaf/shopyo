import 'package:flutter/material.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/core/routes/app_routes.dart';

class TestOneScreen extends StatelessWidget {
  const TestOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(title: Text('One')),
      body: Column(
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                context.pushName(AppRoutes.testTwo);
              },
              child: Text(
                'Go Two Screen',
                style: TextStyle(color: context.color.mainColor, fontSize: 30),
              ),
            ),
          ),
          Image.asset(context.asset.testImage ?? ""),
        ],
      ),
    );
  }
}
