import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopyo/core/common/widgets/customer_app_bar.dart';
import 'package:shopyo/core/di/injection_container.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/features/customer/product_details/presentation/bloc/product_details_bloc/product_details_bloc.dart';
import 'package:shopyo/features/customer/product_details/presentation/refactors/add_to_cart_button.dart';
import 'package:shopyo/features/customer/product_details/presentation/refactors/product_deatils_custom_painter.dart';
import 'package:shopyo/features/customer/product_details/presentation/refactors/products_details_body.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productId});
  final int productId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<ProductDetailsBloc>()
            ..add(ProductDetailsEvent.productDetails(productId: productId)),
      child: Scaffold(
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
            ProductsDetailsBody(),
          ],
        ),
      ),
    );
  }
}
