import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/features/admin/add_products/data/models/get_all_product_response.dart';
import 'package:shopyo/features/customer/home/presentation/widgets/products/product_item.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.productList});
  final List<ProductGetAllModel> productList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 15,
          childAspectRatio: 165 / 250,
        ),
        itemBuilder: (context, index) {
          return ProductItem(
            price: productList[index].price ?? 0,
            categoryName: productList[index].category!.name ?? '',
            title: productList[index].title ?? '',
            imageUrl: productList[index].images!.first,
          );
        },
      ),
    );
  }
}
