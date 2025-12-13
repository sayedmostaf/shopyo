import 'package:flutter/material.dart';
import 'package:shopyo/core/common/widgets/customer_app_bar.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productId});
  final int productId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomerAppBar(title: 'Title'));
  }
}
