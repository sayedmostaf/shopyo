import 'package:flutter/material.dart';
import 'package:shopyo/core/common/widgets/customer_app_bar.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/features/customer/product_details/presentation/refactors/add_to_cart_button.dart';
import 'package:shopyo/features/customer/product_details/presentation/refactors/product_deatils_custom_painter.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productId});
  final int productId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomerAppBar(title: 'Title'),
      bottomNavigationBar: AddToCartButton(price: 100),
      body: Stack(
        children: [
          CustomPaint(
            size: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height,
            ),
            painter: DetailsCustomPainter(
              gradient: LinearGradient(
                colors: [
                  context.color.bluePinkLight!,
                  context.color.bluePinkDark!,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
