import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/core/routes/app_routes.dart';

class HomeCustomerScreen extends StatelessWidget {
  const HomeCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.mainColor,
      appBar: AppBar(
        backgroundColor: context.color.mainColor,

        title: Text('Home Customer', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: TextButton(
          onPressed: () async {
            final token = await FirebaseMessaging.instance.getToken();

            print(token);
          },
          child: const Text(
            'Get Token',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
