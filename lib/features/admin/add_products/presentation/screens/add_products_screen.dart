import 'package:flutter/material.dart';
import 'package:shopyo/core/common/widgets/admin_app_bar.dart';
import 'package:shopyo/core/style/colors/colors_dark.dart';
import 'package:shopyo/features/admin/add_products/refactors/add_products_body.dart';

class AddProductsScreen extends StatelessWidget {
  const AddProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsDark.mainColor,
      appBar: AdminAppBar(
        title: 'Products',
        isMain: true,
        backgroundColor: ColorsDark.mainColor,
      ),
      body: AddProductsBody(),
    );
  }
}
