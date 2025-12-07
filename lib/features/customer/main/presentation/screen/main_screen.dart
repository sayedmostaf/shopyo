import 'package:flutter/material.dart';
import 'package:shopyo/features/customer/main/presentation/refactors/main_customer_app_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: MainCustomerAppBar());
  }
}
