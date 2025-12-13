import 'package:flutter/material.dart';
import 'package:shopyo/core/common/widgets/customer_app_bar.dart';
import 'package:shopyo/features/customer/category/presentation/refactors/category_body.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.categoryInfo});
  final ({String categoryName, int categoryId}) categoryInfo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomerAppBar(title: categoryInfo.categoryName),
      body: CategoryBody(),
    );
  }
}
