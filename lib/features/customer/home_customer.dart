import 'package:flutter/material.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/core/routes/app_routes.dart';

class HomeCustomerScreen extends StatelessWidget {
  const HomeCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Customer')),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              context.pushReplacementNamed(AppRoutes.login);
            },
            child: Text('logout', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
