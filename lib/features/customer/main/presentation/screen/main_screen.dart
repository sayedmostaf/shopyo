import 'package:flutter/material.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/features/customer/main/presentation/refactors/main_bottom_nav_bar.dart';
import 'package:shopyo/features/customer/main/presentation/refactors/main_customer_app_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainCustomerAppBar(),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(context.asset.homeBg!),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Expanded(child: Text('Main Screen Body')),
            MainBottomNavBar(),
          ],
        ),
      ),
    );
  }
}
